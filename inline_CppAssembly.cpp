
#include <iostream>

int main()
{
    char myChar;
    std::cin >> myChar;
    _asm
    {
        cmp myChar, 'a'
        jl nocap
        cmp myChar, 'z'
        ja nocap
        sub myChar, 32
        
        nocap:
    }
    std::cout << myChar << std::endl;
}
