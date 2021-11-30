#! /bin/bash/ -x

echo "Welcome"

isPresent=$((RANDOM%3))
valueForPresent=1
valueForPartTime=2
wagePerHour=20
wagePerForPatTime=20
FullDayPartTimeWorkingHour=8
FullDayWorkingHour=8
empWorkedHour=0
totalSalary=0
empWage=0

if [ $isPresent -eq $valueForPresent ]
then
	echo "Emp is present."
	empWorkedHour=$FullDayWorkingHour
	empWage=$wagePerHour
else
	if [ $isPresent -eq $valueForPartTime ]
	then
		echo "Emp is doing part time"
		empWorkedHour=$FullDayPartTimeWorkingHour
		empWage=$wagePerForPatTime
	else
		echo "Emp is absent."
	fi
fi

function CalculatEmpWage(){
	empWorked=$1
	wagePerHour=$2
	echo $(($empWorked*$wagePerHour))
}

if [ $isPresent -eq $valueForPresent ] || [ $isPresent -eq $valueForPartTime ]
then
	totalSalary=`CalculatEmpWage $empWorkedHour $empWage`	
fi

echo "Total Salary for one day "$totalSalary

