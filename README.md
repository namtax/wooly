# Wooly

## Info

Displays results for TV SMS voting campaigns

## Installation

Clone directory

```
git clone git@github.com:namtax/wooly.git
```

Configure ruby

```
cp .ruby-version.example .ruby-version
```

Bundle

```
bundle
```

Seed Database

```
rake db:seed
```
This takes a while so go grab a coffee.
The rake task uses an input file stored at ``` /config/notes.txt ``` - please replace this file if you would like fresh data.


## Running

```
rails s
```

## End of readme

Well done - have a cookie