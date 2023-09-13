@testset "demojify" begin
  doc = test_pandoc("""
  Hello world :wave:

  ```sh
    echo 😎cool # comment
  ```
  """; demojify = true)

  @test """
*test.txt*                                                    Test Description

==============================================================================
Table of Contents                                     *test-table-of-contents*

Hello world

>sh
      echo cool # comment
<

Generated by panvimdoc <https://github.com/kdheepak/panvimdoc>

vim:tw=78:ts=8:noet:ft=help:norl:
""" == doc

  doc = test_pandoc("""
  Hello world :wave:

  ```sh
    echo 😎cool # comment
  ```
  """; demojify = false)

  @test """
*test.txt*                                                    Test Description

==============================================================================
Table of Contents                                     *test-table-of-contents*

Hello world :wave:

>sh
      echo 😎cool # comment
<

Generated by panvimdoc <https://github.com/kdheepak/panvimdoc>

vim:tw=78:ts=8:noet:ft=help:norl:
""" == doc
end
