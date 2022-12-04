#include <iostream>
#include <string>
#include <vector>
#include <iterator>
#include <fstream>
#include <sstream>
using namespace std;


bool includes_other(int a, int b, int c, int d)
{
    if(a <= c && d <= b)
    {
        return true;
    }
    else if(c <= a && b <= d)
    {
        return true;
    }
    return false;
}

bool overlaps_other(int a, int b, int c, int d)
{
    if(b < c)
    {
        return false;
    }
    else if(a > d)
    {
        return false;
    }
    return true;
}

int part1(vector<string> input)
{
    int count = 0;

    for(auto line : input){
        stringstream ss{line};
        int a,b,c,d;
        char trash;
        // int-int,int-int
        ss >> a >> trash >> b >> trash >> c >> trash >> d;

        if(includes_other(a,b,c,d))
        {
            count++;
        }
    }

    return count;
}

int part2(vector<string> input)
{
    int count = 0;

    for(auto line : input){
        stringstream ss{line};
        int a,b,c,d;
        char trash;
        // int-int,int-int
        ss >> a >> trash >> b >> trash >> c >> trash >> d;

        if(overlaps_other(a,b,c,d))
        {
            count++;
        }
    }
    return count; 
}

int main()
{
    ifstream file("input.txt");
    std::vector<string> input{ istream_iterator<string>(file), istream_iterator<string>() };
    for( auto line : input)
    {
        line.pop_back();
    }


    cout << "Part 1: " << part1(input) << endl;
    cout << "Part 2: " << part2(input) << endl;

    cin.get();
}