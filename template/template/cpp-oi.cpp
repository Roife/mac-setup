#include <cstdio>
#include <cstring>
#include <cctype>
#include <algorithm>
#include <iostream>
#include <ctime>

int read() {
    int x,f=1;char c;
    while(!isdigit(c=getchar())) if(c=='-') f=-f;x=c^48;
    while(isdigit(c=getchar())) x=(x<<1)+(x<<3)+c^48;
    return x*f;
}

int main() {
    return 0;
}
