# Rales(Rails) Engine 
Rales Engine is a Rails and ActiveRecord app that is used to build a JSON API which exposes SalesEngine data schema. This can be used for large scale data stored in CSVs for a range of e-commerce companies.

## Getting Started
1. Fork or clone this repository from Github
2. Clone the repository locally by running: 
```git clone <web link to repo>```
3. Enter into the file with: 
```cd rales_engine```
4. Run ```bundle install``` to include all Gems
5. Setup your database with this command:
```rails db:create db:migrate```
Load all the CSV files from  https://github.com/turingschool-examples/sales_engine/tree/master/data and save to db/csv
Run:
```rake import```
6. Boot your server by running
```rails s```
7. Run ```rails c``` and check for ```Invoice.all``` to make sure your data has loaded

## Developers
[Josi McClellan](https://github.com/JosiMcClellan)
[Katy Welyczko](https://github.com/katyjane8)

## Acknowledgments
The project and guidelines were developed by the Turing School of Software and Design: http://backend.turing.io/module3/projects/rails_engine
