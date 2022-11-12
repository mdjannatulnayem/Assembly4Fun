// includes
#include <iostream>


/*subroutines*/
extern "C" float someFunction();



/* main program*/
int main()
{
	//int i = 0;
	//_asm { //for x86 only
	//	mov i, 26851
	//}
	//std::cout << i << std::endl;
	std::cout << "Result: " << someFunction() << std::endl;
	return 0;
}