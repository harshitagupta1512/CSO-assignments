#include <stdio.h>
void rotateAnticlockwise(short int M[8][8]);
int main(void)
{
    //16bits - 2bytes
    short int M[8][8];
    for (int i = 0; i < 8; i++)
        for (int j = 0; j < 8; j++)
            scanf("%hd", &M[i][j]);

    rotateAnticlockwise(M);

    for (int i = 0; i < 8; i++)
    {
        for (int j = 0; j < 8; j++)
            printf("%hd ", M[i][j]);
        printf("\n");
    }
}