#include <cstdio>
#include <cstring>
#include <cctype>
#include <algorithm>
#include <iostream>
#include <ctime>
#define lop(i, b, e) for(int i=b; i<=e; ++i)
#define pol(i, b, e) for(int i=b; i>=e; --i)
#define file(x) freopen(x".in", "r", stdin); freopen(x".out", "w", stdout);
#define test(x) std::cout << #x << " = " << x << std::endl;
#define mset(x) memset(x, 0, sizeof x);
typedef long long LL;
const int INF = 0x3f3f3f3f;

int read() {
    int x,f=1;char c;
    while(!isdigit(c=getchar())) if(c=='-') f=-f;x=c^48;
    while(isdigit(c=getchar())) x=(x<<1)+(x<<3)+c^48;
    return x*f;
}

int main() {
    return 0;
}
