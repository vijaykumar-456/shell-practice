#!bin/bash

echo "Please enter your name:"
read USER_NAME #here username is the variable, whatever you enter in the terminal stores in the variable

echo "your name is $USER_NAME"

echo "Please enter your password:"
read PASSWORD

echo "your password : $PASSWORD"

# Hiding the username and password while typing / entering

echo "please enter your name:"
read -s USER_NAME

echo "This is your name: $USER_NAME"

echo "please enter your Password:"
read -s PASSWORD

echo "This is your password: $PASSWORD"
