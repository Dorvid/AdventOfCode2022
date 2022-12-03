#include <iostream>
#include <vector>
#include <string>
#include <iterator>
#include <fstream>
#include <map>
using namespace std;

map<char, int> PRIOROTY{{'a', 1},  {'b', 2},  {'c', 3},  {'d', 4},  {'e', 5},  {'f', 6},  {'g', 7},
                        {'h', 8},  {'i', 9},  {'j', 10}, {'k', 11}, {'l', 12}, {'m', 13}, {'n', 14},
                        {'o', 15}, {'p', 16}, {'q', 17}, {'r', 18}, {'s', 19}, {'t', 20}, {'u', 21},
                        {'v', 22}, {'w', 23}, {'x', 24}, {'y', 25}, {'z', 26}, {'A', 27}, {'B', 28}, 
                        {'C', 29}, {'D', 30}, {'E', 31}, {'F', 32}, {'G', 33}, {'H', 34}, {'I', 35},
                        {'J', 36}, {'K', 37}, {'L', 38}, {'M', 39}, {'N', 40}, {'O', 41}, {'P', 42},
                        {'Q', 43}, {'R', 44}, {'S', 45}, {'T', 46}, {'U', 47}, {'V', 48}, {'W', 49},
                        {'X', 50}, {'Y', 51}, {'Z', 52}};


char common_char(string comp1, string comp2)
{
    char common_char;
    int c1[123] = {0}, c2[123] = {0};
    unsigned i;
    for(i = 0; i < comp1.length(); i++){ c1[comp1[i]]++; }
    for(i = 0; i < comp2.length(); i++){ c2[comp2[i]]++; }

    for(i = 0; i < 123; i++)
    {
        if(c1[i] != 0 && c2[i] != 0)
        {
            common_char = char(i);
            break;
        }
    }
    return common_char;
}

int part1(vector<string> input)
{
    int sum = 0;
    for( auto line : input)
    {
        unsigned compartment_size = line.length() / 2;
        string comp1 = line.substr(0, compartment_size);
        string comp2 = line.substr(compartment_size);

        char c = common_char(comp1, comp2);
        sum += PRIOROTY[c];
    }
    return sum;
}

char common_char_group(string comp1, string comp2, string comp3)
{
    char group;
    int c1[123] = {0}, c2[123] = {0}, c3[123] = {0};
    unsigned i;
    for(i = 0; i < comp1.length(); i++){ c1[comp1[i]]++; }
    for(i = 0; i < comp2.length(); i++){ c2[comp2[i]]++; }
    for(i = 0; i < comp3.length(); i++){ c3[comp3[i]]++; }

    for(i = 0; i < 123; i++)
    {
        if(c1[i] != 0 && c2[i] != 0 && c3[i] != 0)
        {
            group = char(i);
            break;
        }
    }
    return group;
}

int part2(vector<string> input)
{
    int sum = 0;
    char group;
    unsigned i;
    for(i = 0; i < input.size() - 2; i+=3){
        string elf1 = input[i], elf2 = input[i+1], elf3 = input[i+2];

        group = common_char_group(elf1, elf2, elf3);
        sum += PRIOROTY[group];
    }

    return sum;
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

    std::cin.get();
}