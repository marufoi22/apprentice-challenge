#!/bin/bash
read -p "Enter two numbers:" num1 num2
read -p "Choose an arithmetic operation (+, -, *, /):" arithmetic
anser=$(($num1 $arithmetic $num2))
echo "The result:"$anser
