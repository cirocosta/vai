<h1 align="center">vai ⚡️  </h1>

<h5 align="center">A CLI script runtime to bring order to your scripts</h5>

<br/>

### Overview

`vai` is a little piece of `bash` scripting that aims at enforcing a certain organization in how scripts advertise their use as well as providing a way of discovering a other commands that belong to a given project.

This can be best understood with an example.

Say that our project has 3 scripts that perform the following functions:

- `say-hello.sh`: prints `hello` to stdout
- `say-world`: adds `one` to whatever comes in the first arg
- `say-haha`: reverses a string

We can take the traditional method of simply putting all of them under a directory and creating a `README.md` that documents it. Or, use `vai` and implement few methods that advertise their functionality:

```
scripts
├── say-haha.sh
├── say-hello.sh
└── say-world.sh
```

Each of these scripts would then implement two methods: `description` and `main`.

Having these two methods implemented, the expected interface is fulfilled and so `vai` can route executions to them.

```sh
#!/bin/bash

description () {
  echo 'Prints `hello` to stdout.'
}

main () {
  echo "hello!"
}

eval "$@"
```

This way, `vai list` shows the commands:

```sh
vai

  USAGE:
    vai <command> [args]

  COMMANDS:
    help                  Prints a command's help message                   
    say-world             Prints `world` to stdout.                         
    say-hello             Prints `hello` to stdout.                         
    description           Prints a project's description                    
    list                  Lists available 'vai' commands                    
    say-haha              Prints `haha` to stdout.                          

vai say-world
world!
```

