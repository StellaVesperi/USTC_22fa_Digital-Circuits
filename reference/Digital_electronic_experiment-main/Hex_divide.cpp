#include <iostream>
#include <iomanip>
#include <fstream>
#include <sstream>
using namespace std;

int Atoint(string s, int radix)
{
    int ans = 0;
    for (int i = 0; i < s.size(); i++)
    {
        char t = s[i];
        if (t >= '0' && t <= '9')
            ans = ans * radix + t - '0';
        else
            ans = ans * radix + t - 'a' + 10;
    }
    return ans;
}

int num_length(int n)
{
    int sum = 0;
    while (n)
    {
        sum++;
        n /= 10;
    }
    return sum;
}

void left_gun(int x)
{
    int t[16] = {0};
    x *= 2;
    for (int i = 0; i < 16; i++)
    {
        t[15 - i] = x;
        x *= 2;
    }
    for (int i = 0; i < 16; i++)
    {
        if (i == 8)
            cout << endl;
        cout << hex << t[i] << " ";
    }
    cout << endl;
}

void right_gun(int x)
{
    for (int i = 0; i < 16; i++)
    {
        if (i == 8)
            cout << endl;
        cout /*<<setw(4)<<setfill('0')*/ << hex << x << " ";
        x /= 2;
        //x *= 2;
    }
    cout << endl;
}
int main()
{
    string str[16];
    string line;
    ifstream file;
    file.open("C:/Users/Lenovo/Desktop/hexnum.txt");
    int i = 0;
    while (getline(file, line))
    {
        str[i++] = line;
    }
    int n = str->size() / 4;
    int x[18];
    for (int k = 0; k < n; k++)
    {
        int j = 0;
        string s;
        for (int i = 0; i < str->size(); i++)
        {
            if (i % 4 == 0 && i != 0)
            {
                x[j++] = Atoint(s, 16);
                s.clear();
            }
            s += str[k][i];
        }
        cout<<"ROM"<<k+1<<":"<<endl;
        for (int i = 0; i < 16; i++)
        {
            left_gun(x[i]);
            right_gun(x[i]);
        }
        cout<<endl;
    }
}
