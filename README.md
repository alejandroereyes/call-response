# Call Response

This program simiulates a call response from a client to a server. User will enter in a valid http request and will receive a response based on their entry.

## Feautres

  * User can access all users info
  * User can access user info via id, first_name, last_name, or age parameter
  * User can set limit on amount of users sent back
  * User can offset starting point of users sent back
  * A user can be deleted via id

## How to Run file
  * Fork this repo
  * Clone this repo
  * run `ruby bin/run.rb` from the call-response folder to run program



## Folders & Files

```
└── call-response
    ├── Gemfile                 # Details which gems are required by the project
    ├── Gemfile.lock            # Defines `rake generate:migration` and `
    ├── README.md               # This file
    ├── Rakefile
    ├── bin
    │   └── run.rb              # `ruby bin/run.rb` will start the program.
    ├── config
    │   └── database.yml        # Defines the database config (e.g. name of file)
    ├── console.rb              # `ruby console.rb` starts `pry` with models loaded
    ├── db
    │   ├── dev.sqlite3         # Default location of the database file
    │   ├── migrate             # Folder containing generated migrations
    │   │   └── 20150601140622_create_user.rb  # Migration class file, creates table
    │   └── setup.rb            # `require`ing this file sets up the db connection
    └── lib                     # Ruby code (models, etc.)
        ├── all.rb              # Require this file to auto-require _all_ `.rb` files in `lib`
        └── user.rb             # Require this file to auto-require _all_ `.rb` files in `lib`

```
