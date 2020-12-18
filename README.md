<h1 align="center">
  <strong align="center">La Main Verte - API</strong>
</h1>

## This is the API behind La Main Verte

Go check it: __[La Main Verte](https://la-main-verte.herokuapp.com/)__  
The REACT application is also on [github](https://github.com/antoine-tech/NEXT_REACT_LaMainVerte).

<details>
<summary>Example</summary>

flibustier [at] yopmail.com || azerty
</details>  

#### Installation instructions

This application is based on Ruby 2.7.1 and Rails 6.0.3.4.
1. Install dependencies: `sudo apt install postgresql-12`
2. Install gems: `bundle install`
3. Create pg database: `rails db:create`
4. Migrate: `rails db:migrate`
5. Run the seed to fill database: `rails db:seed`
   
##  Technical aspects
Our database:
* __users__: stores informations concerning users
* __gardens__: stores informations concerning gardens
* __garden_comments__: stores informations concerning gardens_comments
* __posts__: stores informations concerning posts
* __post_comments__: stores informations concerning post_comments
* __follows__: a relationnal table between users and gardens that they want to follow
* __events__: stores informations concerning events of a garden
* __locations__: stores the name of every french departments
* __climates__: stores informations concerning climates
* __testimonies__: stores informations concerning testimonies
* __tags__: stores pre-registered tags
* __garden_tags__ and __post_tags__: two relationnal tables between gardens/posts and tags

