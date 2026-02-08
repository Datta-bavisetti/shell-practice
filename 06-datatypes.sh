#1/bin/bash
# This script demonstrates various data types in Bash
NUM1=10
NUM2=5
SUM=$((NUM1 + NUM2))
echo "The sum of $NUM1 and $NUM2 is $SUM"

# Demonstrating string datatype
STR1="Hello"
STR2="World"
CONCAT_STR="$STR1, $STR2!"
echo "Concatenated String: $CONCAT_STR"

# Demonstrating array datatype
FRUITS=("Apple" "Banana" "Cherry")
echo "All Fruits: ${FRUITS[@]}"
echo "First Fruit: ${FRUITS[0]}"
echo "Second Fruit: ${FRUITS[1]}"
echo "Third Fruit: ${FRUITS[2]}"

# Demonstrating boolean
IS_RAINING=true
if $IS_RAINING; then
    echo "It's raining outside. Don't forget your umbrella!"
else
    echo "It's not raining. Enjoy your day!"
fi