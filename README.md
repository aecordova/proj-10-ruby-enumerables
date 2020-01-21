<h1 align="center">[Ruby] Project 10 - My Enumerables</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-0.0.1-blue.svg?cacheSeconds=2592000" />
  <a href="#" target="_blank">
    <img alt="License: MIT " src="https://img.shields.io/badge/License-MIT -yellow.svg" />
  </a>
   <a href="https://twitter.com/ae_cordova" target="_blank">
    <img alt="Twitter: ae_cordova " src="https://img.shields.io/twitter/follow/ae_cordova .svg?style=social" />
  </a>
</p>


## Description of the project 

>The purpose of this project is to rebuild or replicate the functionality of some of the most used methods in the ruby enumerable module: each, each_with_index, select, all?, none?, any?, count, map and inject. All of them have the prefix "my_"

## Built with
<ul>
  <li>Ruby</li>
</ul>

## Dev Environment Requirement:
Ruby needs to be installed to run the code check [here](https://www.ruby-lang.org/en/documentation/installation/) for further steps

## ⭐️ Running the code

Please download the .rb file and add it to your project to extend your current enumerable module 

```
require './my_enumerable_module.rb'
```

Or uncomment the lines 99 to 102 to try them with generic test cases.

```
# TEST CASES
# print "\n my_each: \n"
# [1,2,3,4,5,6,7].my_each { |v| print "  val: #{v}\n" }
#
# print "\n my_each_with_index: \n"
# [1,2,3,4,5,6,7].my_each_with_index { |v, k| print "  val: #{v}  ind: #{k} \n" }
#
# print "\n my_select: "
# print [1,2,3,4,5,6,7].my_select{ |x| x % 2 == 0 }
#
# print "\n\n my_all?: "
# puts [1,2,3,4,5,6,7].my_all? { |x| x > 2 }
#
# print "\n my_any?: "
# puts [1,2,3,4,5,6,7].my_any?{ |x| x > 4 }
#
# print "\n my_my_none?: "
# puts [1,2,3,4,5,6,7].my_none? { |x| x > 1 }
#
# print "\n my_count using a block:"
# puts [1,2,3,4,5,6,7].my_count { |x| x > 4 }
#
# print "\n my_count using an argument:"
# puts [1,2,3,4,5,6,7].my_count(3)
#
# print "\n my_map using a block:"
# puts [1,2,3,4,5,6,7].my_map { |x| x ** 4 }
#
# print "\n my_inject using a block:"
# puts [1,2,3,4,5,6,7].my_inject { |running_total, number| running_total + number }
#
# print "\n my_inject using an  operator as a symbol:"
# puts [1,2,3,4,5,6,7].my_inject(:*)
#
# print "\n Defining and using multiply_els for testing my_inject: "
# def multiply_els(arr)
#   arr.my_inject(:*)
# end
# puts multiply_els([2, 4, 5])
# print "\n Defining a proc to be used with my_map: \n"
# some_proc = Proc.new { |x| x ** 4 }
#
# print "\n Using my_map with a proc and with both a prc and a block: \n"
# puts [1,2,3,4,5,6,7].my_map(some_proc)
# puts [1,2,3,4,5,6,7].my_map() { |x| x ** 4 }
#
```

<!-- CONTRIBUTING -->
## Contributing

Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Author ## 

👤 **Angel Cordova** 

* Github: [@aecordova](https://github.com/https:\/\/github.com\/aecordova)
* Twitter [@ae_cordova](https://twitter.com/ae_cordova)
