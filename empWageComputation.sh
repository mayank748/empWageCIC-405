#! /bin/bash/ -x

echo "Welcome"
declare -A dayDailWageTotalWageDictionary
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
totalWorkingHourInMonth=100
workedHourInMonth=0

function CalculatEmpWage(){
	empWorked=$1
	wagePerHour=$2
	echo $(($empWorked*$wagePerHour))
}

function CalculateEmpTotalWorkedHour(){
	empWorkedForTotalPassedDays=$1
	empWorkedInTheSameDay=$2
	echo $(($empWorkedForTotalPassedDays+$empWorkedInTheSameDay))
}

while [ $daysPased -le $numberOfWorkingDaysInMonth ] && [ $workedHourInMonth -le $totalWorkingHourInMonth ]
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
	workedHourInMonth=`CalculateEmpTotalWorkedHour $workedHourInMonth $empWorkedHour`
fi
echo "Total Salary for one day "$totalSalary
totalSalaryForMonth=$(($totalSalaryForMonth+$totalSalary))
wageArray[ $daysPased ]=`echo '{ Daily Wage '$totalSalary 'Total Wage '$totalSalaryForMonth '},'`
	if [ $daysPased -eq 20 ] || [ $workedHourInMonth -ge 100 ]
	then
		valueAtLast=${wageArray[ $daysPased ]}
		wageArray[ $daysPased ]=`echo $valueAtLast | awk -F, '{print $1}'`
	fi
dayDailWageTotalWageDictionary[$daysPased]=${wageArray[$daysPased]}
((daysPased++))
done

echo "days values  "${!dayDailWageTotalWageDictionary[@]}
echo "Total daily wage with total wage with days value  "${dayDailWageTotalWageDictionary[@]}

