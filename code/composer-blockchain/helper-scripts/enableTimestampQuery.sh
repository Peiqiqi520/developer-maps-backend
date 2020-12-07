
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{
  "index": {
    "fields": [
      {
        "data.timestamp": "asc"
      }
    ]
  },
  "type": "json"
}' 'http://localhost:5984/composerchannel_/_index'