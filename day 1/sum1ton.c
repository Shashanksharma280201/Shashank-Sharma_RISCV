#include <stdio.h>

int main() {
    int i, sum = 0, n = 12;

    for (i = 1; i <= n; i++) {
        sum += i;
    }
    printf("Sum of the numbers from 1 to %d is %d ", n, sum);
    return 0;
}