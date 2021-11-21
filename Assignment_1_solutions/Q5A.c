//Given two 16 bit signed integers A and B. Find the hamming distance between them and
//store the result in another integer C. Refernce link
int getHammingDistance(short int a, short int b);
#include <stdio.h>
int main(void)
{
    printf("Enter two integers :- ");
    short int a, b;
    scanf("%hd %hd",&a, &b);
    int c = getHammingDistance(a,b);
    printf("Hamming Distance = %d",c);
}