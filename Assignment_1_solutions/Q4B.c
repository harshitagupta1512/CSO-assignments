#include <stdio.h>
//Given a character array C of length 32. Count the frequency of each capital letter ‘A’ to ‘Z’
//appearing in C. Report 0 in case an alphabet does not appear in C.
void getFrequencyCapitalLetter(char str[32], short int arr[26]);

int main(void)
{
    char str[32];
    scanf("%s", str);
    short int arr[26];

    getFrequencyCapitalLetter(str, arr);

    for (int i = 0; i < 26; i++)
        printf("%hd ", arr[i]);
}