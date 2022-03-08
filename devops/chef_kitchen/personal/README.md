# Kitchen Snippets

## Installation

### Requirements

- chef workstation
- virtualbox
- vagrant

## Help

```Bash
kitchen help
```

```Bash
kitchen help <command_name>
```

## List of instance (suite + platform)

```Bash
kitchen list
```

## Run new instance

```Bash
kitchen create <instance_name>
```

It can be run without instance name and run all the instances listed in the *kitchen.yml*.

## Converge instance

```Bash
kitchen converge <instance_name>
```

It can be run without instance name and run all the instances listed in the *kitchen.yml*.

## Login on the instance

```Bash
kitchen login <instance_name>
```

It can be run without instance name and run all the instances listed in the *kitchen.yml*.

## Verify tests

```Bash
kitchen verify <instance_name>
```

It can be run without instance name and run all the instances listed in the *kitchen.yml*.

## Test from scratch

```Bash
kitchen test <instance_name>
```

It can be run without instance name and run all the instances listed in the *kitchen.yml*.
