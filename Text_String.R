#알파벳 출력
letters;LETTERS
LETTERS[3:6]

#대소문자 변환
tolower("Eye for eye")
toupper("Eye for eye")

#글자수
nchar('Korea')
nchar('한국')
nchar('한국', type = 'bytes')
nchar("Ko re a")


mysentence <- "Learning R is so interesting"
#단어별 분리
strsplit(mysentence, split = ' ')

#글자별 분리
strsplit(mysentence, split = '')

sentence <- c("1st", "2nd", "3rd")
paste(sentence, sep = ", ")
paste0(sentence)

R_content <- "R is a free software environment for statistical computing and graphics. It compiles and runs on a wide variety of UNIX platforms, Windows and MacOS. To download R, please choose your preferred CRAN mirror.

If you have questions about R like how to download and install the software, or what the license terms are, please read our answers to frequently asked questions before you send an email."

#문단별 분리
R_parag <- strsplit(R_content, split = '\n')
R_parag

#문장별 분리
R_sentence <- strsplit(R_parag[[1]], split = '\\.')
R_sentence

#단어별 분리
R_word <- strsplit(R_parag[[1]], split = ' ')
R_word

#단어 찾기 
grep('software', R_sentence)
grepl('software', R_sentence)

#단어 바꾸기 sub는 한 번만, gsub는 전부
sub('ing', 'ING', mysentence)
gsub('ing', 'ING', mysentence)
gsub('R |so |is ', "BB", mysentence)
gsub('R |so |is ', "", mysentence)

#문자열 추출
substr("abcdef", 2, 4)
substr(mysentence, 1, 10)

##★정규표현식
#[]는 or|, ()는 and&, ^는 not 의미

#확장문자열 : \n, \t, \', \" 등
cat("a\nb")

#반복횟수 정량
string <- c("a", "ab", "acb", "accb", "acccb", "accccb")

grep("cb", string ,value = "TRUE")
grep("c*b", string ,value = "TRUE")
grep("c+b", string ,value = "TRUE")
grep("ac?b", string ,value = "TRUE")
grep("ac{2}b", string ,value = "TRUE")
grep("ac{2,}b", string ,value = "TRUE")
grep("ac{2,3}b", string ,value = "TRUE")

string2 <- c("abcd", "bcda", "cdab","dabc")
grep("ab", string2 ,value = "TRUE")
grep("^ab", string2 ,value = "TRUE")
grep("^(ab)", string2 ,value = "TRUE")
grep("^a|ab", string2 ,value = "TRUE")
grep("ab$", string2 ,value = "TRUE")

#\w : 단어 문자, (= [[:alnum:]], = [A-z0-9])
#\W : 단어 문자가 아닌 것. (=[^A-z0-9])
