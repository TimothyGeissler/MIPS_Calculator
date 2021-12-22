#include <stdio.h>

int main() {
    int x = 47;
    int* p = &x;

    printf("%d, %x\n", x, p);


    char str [] = "abcdefg";
    int* str_p1 = &str[0];
    int* str_p2 = &str[1];
    int* str_p3 = &str[2];
    printf("%s, %x, %x, %x\n", str, str_p1, str_p2, str_p3);

    return 0;
}