# Where the ambientum cache will live
A_BASE=$HOME/.cache/ambientum

# Define specific cache directories
A_CONFIG=$A_BASE/.config
A_CACHE=$A_BASE/.cache
A_LOCAL=$A_BASE/.local
A_SSH=$HOME/.ssh
A_COMPOSER=$A_BASE/.composer

# Create directories
mkdir -p $A_CONFIG
mkdir -p $A_CACHE
mkdir -p $A_LOCAL
mkdir -p $A_COMPOSER

###########################################
#### DO NOT EDIT BELOW THIS LINE UNLESS   #
#### YOU KNOW WHAT YOU'RE DOING           #
###########################################

#reset permissions
chown -R $(whoami):$(whoami) $A_BASE

## Home directories prefixes
A_NODE_HOME=/home/node-user
A_PHP_HOME=/home/php-user

####
# Alias for NPM And other node commands
####

# Node Env
function n() {
	docker run -it --rm -v $(pwd):/var/www/app -v $A_CONFIG:$A_NODE_HOME/.config -v $A_CACHE:$A_NODE_HOME/.cache -v $A_LOCAL:$A_NODE_HOME/.local -v $A_SSH:$A_NODE_HOME/.ssh ambientum/node:7 "$@"
}
alias n=n

# PHP Env
function p() {
	docker run -it --rm -v $(pwd):/var/www/app -v $A_COMPOSER:$A_PHP_HOME/.composer -v $A_CONFIG:$A_PHP_HOME/.config -v $A_CACHE:$A_PHP_HOME/.cache -v $A_LOCAL:$A_PHP_HOME/.local -v $A_SSH:$A_PHP_HOME/.ssh ambientum/php:7.1 "$@"
}
alias p=p