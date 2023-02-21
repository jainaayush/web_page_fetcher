# Welcome to Web page scrapper App

## Environment
* Ruby 3.1.0
* Docker

Here is the scrapper which can scrap the web page data and store it into a file. It will also show the meta data inforamtion once we run the program
Ex.
Metadata for https://www.facebook.com:
site: https://www.facebook.com
num_links: 46
images: 2
last_fetch: Mon Feb 20 2023 10:46 UTC

Once the project is setup run the following commands to run the Program:

First Way:
Give persmission for shell script file by following commands:
* `bash fetch.sh`
* `chmod +x fetch.sh`

- `./fetch.sh https://www.github.com https://www.facebook.com` (We can add multiple URLS)

Second Way:
- `docker build -t web_scrapper .`

- `sudo docker run -v /myapp web_scrapper bash -c cd /myapp && ruby web_scrapper.rb https://www.github.com`
