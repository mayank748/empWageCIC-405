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

case $isPresent in 
	$valueForPresent)
		echo "Emp is present."
		empWorkedHour=$FullDayWorkingHour
		empWage=$wagePerHour
	;;
	$valueForPartTime)
		echo "Emp is doing part time"
		empWorkedHour=$FullDayPartTimeWorkingHour
		empWage=$wagePerForPatTime
	;;
	*)
		echo "Emp is absent."
	;;
esac

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

