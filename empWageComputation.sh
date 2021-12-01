#! /bin/bash/ -x

echo "Welcome"

numberOfWorkingDaysInMonth=20
valueForPresent=1
valueForPartTime=2
wagePerHour=20
wagePerForPatTime=20
FullDayPartTimeWorkingHour=8
FullDayWorkingHour=8
empWorkedHour=0
totalSalary=0
empWage=0
daysPased=1
totalSalaryForMonth=0

function CalculatEmpWage(){
	empWorked=$1
	wagePerHour=$2
	echo $(($empWorked*$wagePerHour))
}

while [ $daysPased -le $numberOfWorkingDaysInMonth ]
do

isPresent=$((RANDOM%3))

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
		totalSalary=0
	;;
esac


if [ $isPresent -eq $valueForPresent ] || [ $isPresent -eq $valueForPartTime ]
then
	totalSalary=`CalculatEmpWage $empWorkedHour $empWage`	
fi
echo "Total Salary for one day "$totalSalary
totalSalaryForMonth=$(($totalSalaryForMonth+$totalSalary))
((daysPased++))
done

echo "Total month salary of the employee is "$totalSalaryForMonth


