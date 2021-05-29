#!/bin/bash

curl -s http://localhost:1635/peers | jq '.peers | length'
curl -s http://167.179.79.175:1635/peers | jq '.peers | length'


curl localhost:1635/chequebook/cheque | jq

curl http://localhost:1635/addresses
 