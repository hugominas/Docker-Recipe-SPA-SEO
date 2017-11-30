const usus = require('usus');
const express = require('express');
 

const app = express();

function checkIsValidRequest(urlToGet)
{
    return ( 
        urlToGet !== '' 
        && urlToGet
        && /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/.test(urlToGet)
    ) 
}

app.get('/', (req, res) => {
    if(!checkIsValidRequest(req.query.url)) 
        return res.send('nothing to render')

    const chrome = usus.launchChrome()
    .then(()=>{
        return usus.render(req.query.url, {
            chromePort: chrome.port,
            inlineStyles: true
        })
    })
    .then( (result) => {
        return res.send(result)
        chrome.kill()
    })
    .catch( (err) =>  {
        console.log(err)
        return res.send(err)
        chrome.kill()
    })
   
})

app.listen(8888, () => console.log('listening on port 8888!'))