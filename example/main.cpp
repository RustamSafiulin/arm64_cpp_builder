
#include <string>
#include <iostream>

#include "foo.h"

int main() 
{
	std::cout << "Hello world!!!" << std::endl;

	const std::string s = "Test";
	std::cout << s << std::endl;

    std::cout << test::foo(10, 20) << std::endl;

	return 0;
}