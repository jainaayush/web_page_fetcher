echo "Build docker image..."
docker build -t webscrapper .

echo "----------------------------------------------------------------------------"

echo "Scrap page data with metadata for the URLs..."
sudo docker run -v /myapp web_scrapper bash -c cd /myapp && ruby web_scrapper.rb $*