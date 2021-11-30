#! /bin/bash/ -x

echo "Welcome"

isPresent=$((RANDOM%2))
valueForPresent=1
wagePerHour=20
FullDayWorkingHour=8
empWorkedHour=0
totalSalary=0

if [ $isPresent -eq $valueForPresent ]
then
	echo "Emp is present."
	empWorkedHour=$FullDayWorkingHour
else
	echo "Emp is absent."
fi

totalSalary=$(($empWorkedHour*wagePerHour))
echo "Total Salary for one day "$totalSalary

