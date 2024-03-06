CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

cp student-submission/*.java grading-area
cp *.java grading-area
cp -r lib grading-area

cd grading-area

if ! [ -f ListExamples.java ]
then 
    echo "Missing ListExamples.java in student submission"
    echo "Score: Fail"
    exit
fi 

if ! grep -q 'class\s*ListExamples' "ListExamples.java";
then 
    echo "Missing ListExamples class in student submission"
    echo "Score: Fail"
    exit
fi

javac -cp $CPATH *.java
if [ $? -ne 0 ]
then 
    echo "Compilation Error"
    echo "Score: Fail"
    exit
fi

echo "Score: Pass"
