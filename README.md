# Anna and Ryan Sitting in a Tree README

This is the application for AnnaAndRyanSittingInATree.com, the central information source for those friends and family invited to celebrate the wedding of Anna Birinyi and Ryan Wallace.

* Ruby version: 2.3.1

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```
