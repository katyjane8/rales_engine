# Rales(Rails) Engine
Rales Engine is a Rails and ActiveRecord app that is used to build a JSON API which exposes SalesEngine data schema. This can be used for large scale data stored in CSVs for a range of e-commerce companies.

## Getting Started
1. Clone the repository from Github:
```
git clone <web link to repo>
```
2. Enter into the directory:
```
cd rales_engine
```
3. Install dependencies:
```
bundle install
```
4. Download all six csv files from [this repo](https://github.com/turingschool-examples/sales_engine/tree/master/data), and move them to your project's `\db\csv` directory.
5. Create, migrate, and seed your database
```
rake db:setup
```
6. (make sure you got everything)
```ruby
rails c
# wait for it to start
Transaction.count == 5595
#=> true
```
7. Spin up your server
```
rails s
```
## Developers
- [Josi McClellan](https://github.com/JosiMcClellan)
- [Katy Welyczko](https://github.com/katyjane8)

## Acknowledgments
The project and guidelines were developed by the Turing School of Software and Design: http://backend.turing.io/module3/projects/rails_engine
