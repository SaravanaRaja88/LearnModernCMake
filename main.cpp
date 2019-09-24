#include "HelloWorldLibrary/include/HelloWorld.h"
#include <memory>

int main()
{
    auto helloWorld = std::make_unique<HelloWorldLibrary::HelloWorld>();
    helloWorld->printHelloWorld();

}