#! /bin/bash/ -x

echo "Welcome"

isPresent=$((RANDOM%2))
valueForPresent=1
if [ $isPresent -eq $valueForPresent ]
then
	echo "Emp is present."
else
	echo "Emp is absent."
fi
