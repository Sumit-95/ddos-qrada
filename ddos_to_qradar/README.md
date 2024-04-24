# DDOS To QRadar

## Overview
A Lambda function, triggered by a SNS Topic in each region. 
Lambda creates Cloud Watch Log Group and Cloud Watch Log Stream in first run. 
Then it delivers ddos logs from SNS to Cloud Watch.
