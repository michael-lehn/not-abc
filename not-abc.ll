declare i32 @getchar()
declare void @putchar(i64)
declare i64 @malloc(i64)
declare void @free(i64)
; function print
define i64 @print(i64 %0) {
.L0:
	%s = alloca i64, align 8
	store i64 %0, ptr %s, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	br label %.L1
.L1:
	%.TMP0 = alloca i64, align 8
	%2 = load i64, ptr %s, align 8
	%3 = sub i64 %2, 0
	%4 = icmp ne i64 %3, 0
	br i1 %4, label %.L4, label %.L6
.L6:
	%5 = getelementptr i64, ptr %.TMP0, i64 0
	%6 = ptrtoint ptr %5 to i64
	; load constant 0 into %7
	%7 = add i64 0, 0
	%8 = inttoptr i64 %6 to ptr
	store i64 %7, ptr %8, align 8
	%9  = add i64 %7, 0; bloody hack
	; jump to end
	br label %.L3
.L4:
	%10 = load i64, ptr %s, align 8
	%11 = inttoptr i64 %10 to ptr
	%12 = load i8, ptr %11, align 8
	%13 = zext i8 %12 to i64
	%14 = sub i64 %13, 0
	%15 = icmp ne i64 %14, 0
	br i1 %15, label %.L5, label %.L7
.L7:
	%16 = getelementptr i64, ptr %.TMP0, i64 0
	%17 = ptrtoint ptr %16 to i64
	; load constant 0 into %18
	%18 = add i64 0, 0
	%19 = inttoptr i64 %17 to ptr
	store i64 %18, ptr %19, align 8
	%20  = add i64 %18, 0; bloody hack
	; jump to end
	br label %.L3
.L5:
	%21 = getelementptr i64, ptr %.TMP0, i64 0
	%22 = ptrtoint ptr %21 to i64
	; load constant 1 into %23
	%23 = add i64 1, 0
	%24 = inttoptr i64 %22 to ptr
	store i64 %23, ptr %24, align 8
	%25  = add i64 %23, 0; bloody hack
	br label %.L3
.L3:
	%26 = getelementptr i64, ptr %.TMP0, i64 0
	%27 = ptrtoint ptr %26 to i64
	%28 = inttoptr i64 %27 to ptr
	%29 = load i64, ptr %28, align 8
	%30 = sub i64 %29, 0
	%31 = icmp eq i64 %30, 0
	br i1 %31, label %.L2, label %.L8
.L8:
	%32 = load i64, ptr %s, align 8
	%33 = inttoptr i64 %32 to ptr
	%34 = load i8, ptr %33, align 8
	%35 = zext i8 %34 to i64
	%36 = call i64 @putchar(i64 %35)
	store i64 %36, ptr %1, align 8
	%37 = load i64, ptr %s, align 8
	; load constant 1 into %38
	%38 = add i64 1, 0
	%39 = add i64 %37, %38
	%40 = getelementptr i64, ptr %s, i64 0
	%41 = ptrtoint ptr %40 to i64
	%42 = inttoptr i64 %41 to ptr
	store i64 %39, ptr %42, align 8
	%43  = add i64 %39, 0; bloody hack
	store i64 %39, ptr %1, align 8
	br label %.L1
.L2:
	; load constant 1 into %44
	%44 = add i64 1, 0
	store i64 %44, ptr %1, align 8
	br label %.L9
.L9:
	%45= load i64, ptr %1, align 8
	ret i64 %45
}

; function println
define i64 @println(i64 %0) {
.L10:
	%s = alloca i64, align 8
	store i64 %0, ptr %s, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = load i64, ptr %s, align 8
	%3 = call i64 @print(i64 %2)
	store i64 %3, ptr %1, align 8
	; load constant '\n' into %4
	%4 = add i64 10, 0
	%5 = call i64 @putchar(i64 %4)
	store i64 %5, ptr %1, align 8
	; load constant 1 into %6
	%6 = add i64 1, 0
	store i64 %6, ptr %1, align 8
	br label %.L11
.L11:
	%7= load i64, ptr %1, align 8
	ret i64 %7
}

; function printInt
define i64 @printInt(i64 %0) {
.L12:
	%n = alloca i64, align 8
	store i64 %0, ptr %n, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = load i64, ptr %n, align 8
	; load constant 0 into %3
	%3 = add i64 0, 0
	%4 = icmp slt i64 %2, %3
	%5 = zext i1 %4 to i64
	%6 = sub i64 %5, 0
	%7 = icmp eq i64 %6, 0
	br i1 %7, label %.L14, label %.L15
.L15:
	; load constant '-' into %8
	%8 = add i64 45, 0
	%9 = call i64 @putchar(i64 %8)
	store i64 %9, ptr %1, align 8
	; load constant 0 into %10
	%10 = add i64 0, 0
	%11 = load i64, ptr %n, align 8
	%12 = sub i64 %10, %11
	%13 = getelementptr i64, ptr %n, i64 0
	%14 = ptrtoint ptr %13 to i64
	%15 = inttoptr i64 %14 to ptr
	store i64 %12, ptr %15, align 8
	%16  = add i64 %12, 0; bloody hack
	store i64 %12, ptr %1, align 8
	br label %.L13
.L14:
	br label %.L13
.L13:
	%17 = load i64, ptr %n, align 8
	; load constant 0 into %18
	%18 = add i64 0, 0
	%19 = icmp eq i64 %17, %18
	%20 = zext i1 %19 to i64
	%21 = sub i64 %20, 0
	%22 = icmp eq i64 %21, 0
	br i1 %22, label %.L17, label %.L18
.L18:
	; load constant '0' into %23
	%23 = add i64 48, 0
	%24 = call i64 @putchar(i64 %23)
	store i64 %24, ptr %1, align 8
	br label %.L16
.L17:
	%25 = load i64, ptr %n, align 8
	; load constant 10 into %26
	%26 = add i64 10, 0
	%27 = sdiv i64 %25, %26
	; load constant 0 into %28
	%28 = add i64 0, 0
	%29 = icmp sgt i64 %27, %28
	%30 = zext i1 %29 to i64
	%31 = sub i64 %30, 0
	%32 = icmp eq i64 %31, 0
	br i1 %32, label %.L20, label %.L21
.L21:
	%33 = load i64, ptr %n, align 8
	; load constant 10 into %34
	%34 = add i64 10, 0
	%35 = sdiv i64 %33, %34
	%36 = call i64 @printInt(i64 %35)
	store i64 %36, ptr %1, align 8
	br label %.L19
.L20:
	br label %.L19
.L19:
	%37 = load i64, ptr %n, align 8
	; load constant 10 into %38
	%38 = add i64 10, 0
	%39 = srem i64 %37, %38
	; load constant '0' into %40
	%40 = add i64 48, 0
	%41 = add i64 %39, %40
	%42 = call i64 @putchar(i64 %41)
	store i64 %42, ptr %1, align 8
	br label %.L16
.L16:
	br label %.L22
.L22:
	%43= load i64, ptr %1, align 8
	ret i64 %43
}

; function sprintInt
define i64 @sprintInt(i64 %0, i64 %1) {
.L23:
	%n = alloca i64, align 8
	store i64 %0, ptr %n, align 8
	%s = alloca i64, align 8
	store i64 %1, ptr %s, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%3 = load i64, ptr %n, align 8
	; load constant 0 into %4
	%4 = add i64 0, 0
	%5 = icmp slt i64 %3, %4
	%6 = zext i1 %5 to i64
	%7 = sub i64 %6, 0
	%8 = icmp eq i64 %7, 0
	br i1 %8, label %.L25, label %.L26
.L26:
	; load constant '-' into %9
	%9 = add i64 45, 0
	%10 = load i64, ptr %s, align 8
	%11 = inttoptr i64 %10 to ptr
	%12 = trunc i64 %9 to i8
	store i8 %12, ptr %11, align 8
	%13  = add i64 %9, 0; bloody hack
	store i64 %9, ptr %2, align 8
	%14 = load i64, ptr %s, align 8
	; load constant 1 into %15
	%15 = add i64 1, 0
	%16 = add i64 %14, %15
	%17 = getelementptr i64, ptr %s, i64 0
	%18 = ptrtoint ptr %17 to i64
	%19 = inttoptr i64 %18 to ptr
	store i64 %16, ptr %19, align 8
	%20  = add i64 %16, 0; bloody hack
	store i64 %16, ptr %2, align 8
	; load constant 0 into %21
	%21 = add i64 0, 0
	%22 = load i64, ptr %n, align 8
	%23 = sub i64 %21, %22
	%24 = getelementptr i64, ptr %n, i64 0
	%25 = ptrtoint ptr %24 to i64
	%26 = inttoptr i64 %25 to ptr
	store i64 %23, ptr %26, align 8
	%27  = add i64 %23, 0; bloody hack
	store i64 %23, ptr %2, align 8
	br label %.L24
.L25:
	br label %.L24
.L24:
	%28 = load i64, ptr %n, align 8
	; load constant 0 into %29
	%29 = add i64 0, 0
	%30 = icmp eq i64 %28, %29
	%31 = zext i1 %30 to i64
	%32 = sub i64 %31, 0
	%33 = icmp eq i64 %32, 0
	br i1 %33, label %.L28, label %.L29
.L29:
	; load constant '0' into %34
	%34 = add i64 48, 0
	%35 = load i64, ptr %s, align 8
	%36 = inttoptr i64 %35 to ptr
	%37 = trunc i64 %34 to i8
	store i8 %37, ptr %36, align 8
	%38  = add i64 %34, 0; bloody hack
	store i64 %34, ptr %2, align 8
	%39 = load i64, ptr %s, align 8
	; load constant 1 into %40
	%40 = add i64 1, 0
	%41 = add i64 %39, %40
	%42 = getelementptr i64, ptr %s, i64 0
	%43 = ptrtoint ptr %42 to i64
	%44 = inttoptr i64 %43 to ptr
	store i64 %41, ptr %44, align 8
	%45  = add i64 %41, 0; bloody hack
	store i64 %41, ptr %2, align 8
	br label %.L27
.L28:
	%46 = load i64, ptr %n, align 8
	; load constant 10 into %47
	%47 = add i64 10, 0
	%48 = sdiv i64 %46, %47
	; load constant 0 into %49
	%49 = add i64 0, 0
	%50 = icmp sgt i64 %48, %49
	%51 = zext i1 %50 to i64
	%52 = sub i64 %51, 0
	%53 = icmp eq i64 %52, 0
	br i1 %53, label %.L31, label %.L32
.L32:
	%54 = load i64, ptr %s, align 8
	%55 = load i64, ptr %n, align 8
	; load constant 10 into %56
	%56 = add i64 10, 0
	%57 = sdiv i64 %55, %56
	%58 = call i64 @sprintInt(i64 %57, i64 %54)
	%59 = getelementptr i64, ptr %s, i64 0
	%60 = ptrtoint ptr %59 to i64
	%61 = inttoptr i64 %60 to ptr
	store i64 %58, ptr %61, align 8
	%62  = add i64 %58, 0; bloody hack
	store i64 %58, ptr %2, align 8
	br label %.L30
.L31:
	br label %.L30
.L30:
	%63 = load i64, ptr %n, align 8
	; load constant 10 into %64
	%64 = add i64 10, 0
	%65 = srem i64 %63, %64
	; load constant '0' into %66
	%66 = add i64 48, 0
	%67 = add i64 %65, %66
	%68 = load i64, ptr %s, align 8
	%69 = inttoptr i64 %68 to ptr
	%70 = trunc i64 %67 to i8
	store i8 %70, ptr %69, align 8
	%71  = add i64 %67, 0; bloody hack
	store i64 %67, ptr %2, align 8
	%72 = load i64, ptr %s, align 8
	; load constant 1 into %73
	%73 = add i64 1, 0
	%74 = add i64 %72, %73
	%75 = getelementptr i64, ptr %s, i64 0
	%76 = ptrtoint ptr %75 to i64
	%77 = inttoptr i64 %76 to ptr
	store i64 %74, ptr %77, align 8
	%78  = add i64 %74, 0; bloody hack
	store i64 %74, ptr %2, align 8
	br label %.L27
.L27:
	; load constant 0 into %79
	%79 = add i64 0, 0
	%80 = load i64, ptr %s, align 8
	%81 = inttoptr i64 %80 to ptr
	%82 = trunc i64 %79 to i8
	store i8 %82, ptr %81, align 8
	%83  = add i64 %79, 0; bloody hack
	store i64 %79, ptr %2, align 8
	%84 = load i64, ptr %s, align 8
	store i64 %84, ptr %2, align 8
	br label %.L33
.L33:
	%85= load i64, ptr %2, align 8
	ret i64 %85
}

; function strcpy
define i64 @strcpy(i64 %0, i64 %1) {
.L34:
	%dest = alloca i64, align 8
	store i64 %0, ptr %dest, align 8
	%src = alloca i64, align 8
	store i64 %1, ptr %src, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	br label %.L35
.L35:
	%3 = load i64, ptr %src, align 8
	%4 = inttoptr i64 %3 to ptr
	%5 = load i8, ptr %4, align 8
	%6 = zext i8 %5 to i64
	%7 = sub i64 %6, 0
	%8 = icmp eq i64 %7, 0
	br i1 %8, label %.L36, label %.L37
.L37:
	%9 = load i64, ptr %src, align 8
	%10 = inttoptr i64 %9 to ptr
	%11 = load i8, ptr %10, align 8
	%12 = zext i8 %11 to i64
	%13 = load i64, ptr %dest, align 8
	%14 = inttoptr i64 %13 to ptr
	%15 = trunc i64 %12 to i8
	store i8 %15, ptr %14, align 8
	%16  = add i64 %12, 0; bloody hack
	store i64 %12, ptr %2, align 8
	%17 = load i64, ptr %dest, align 8
	; load constant 1 into %18
	%18 = add i64 1, 0
	%19 = add i64 %17, %18
	%20 = getelementptr i64, ptr %dest, i64 0
	%21 = ptrtoint ptr %20 to i64
	%22 = inttoptr i64 %21 to ptr
	store i64 %19, ptr %22, align 8
	%23  = add i64 %19, 0; bloody hack
	store i64 %19, ptr %2, align 8
	%24 = load i64, ptr %src, align 8
	; load constant 1 into %25
	%25 = add i64 1, 0
	%26 = add i64 %24, %25
	%27 = getelementptr i64, ptr %src, i64 0
	%28 = ptrtoint ptr %27 to i64
	%29 = inttoptr i64 %28 to ptr
	store i64 %26, ptr %29, align 8
	%30  = add i64 %26, 0; bloody hack
	store i64 %26, ptr %2, align 8
	br label %.L35
.L36:
	%31 = load i64, ptr %src, align 8
	%32 = inttoptr i64 %31 to ptr
	%33 = load i8, ptr %32, align 8
	%34 = zext i8 %33 to i64
	%35 = load i64, ptr %dest, align 8
	%36 = inttoptr i64 %35 to ptr
	%37 = trunc i64 %34 to i8
	store i8 %37, ptr %36, align 8
	%38  = add i64 %34, 0; bloody hack
	store i64 %34, ptr %2, align 8
	br label %.L38
.L38:
	%39= load i64, ptr %2, align 8
	ret i64 %39
}

; function strcmp
define i64 @strcmp(i64 %0, i64 %1) {
.L39:
	%s1 = alloca i64, align 8
	store i64 %0, ptr %s1, align 8
	%s2 = alloca i64, align 8
	store i64 %1, ptr %s2, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	br label %.L40
.L40:
	%.TMP1 = alloca i64, align 8
	%3 = load i64, ptr %s1, align 8
	%4 = inttoptr i64 %3 to ptr
	%5 = load i8, ptr %4, align 8
	%6 = zext i8 %5 to i64
	%7 = sub i64 %6, 0
	%8 = icmp ne i64 %7, 0
	br i1 %8, label %.L43, label %.L45
.L45:
	%9 = getelementptr i64, ptr %.TMP1, i64 0
	%10 = ptrtoint ptr %9 to i64
	; load constant 0 into %11
	%11 = add i64 0, 0
	%12 = inttoptr i64 %10 to ptr
	store i64 %11, ptr %12, align 8
	%13  = add i64 %11, 0; bloody hack
	; jump to end
	br label %.L42
.L43:
	%14 = load i64, ptr %s1, align 8
	%15 = inttoptr i64 %14 to ptr
	%16 = load i8, ptr %15, align 8
	%17 = zext i8 %16 to i64
	%18 = load i64, ptr %s2, align 8
	%19 = inttoptr i64 %18 to ptr
	%20 = load i8, ptr %19, align 8
	%21 = zext i8 %20 to i64
	%22 = icmp eq i64 %17, %21
	%23 = zext i1 %22 to i64
	%24 = sub i64 %23, 0
	%25 = icmp ne i64 %24, 0
	br i1 %25, label %.L44, label %.L46
.L46:
	%26 = getelementptr i64, ptr %.TMP1, i64 0
	%27 = ptrtoint ptr %26 to i64
	; load constant 0 into %28
	%28 = add i64 0, 0
	%29 = inttoptr i64 %27 to ptr
	store i64 %28, ptr %29, align 8
	%30  = add i64 %28, 0; bloody hack
	; jump to end
	br label %.L42
.L44:
	%31 = getelementptr i64, ptr %.TMP1, i64 0
	%32 = ptrtoint ptr %31 to i64
	; load constant 1 into %33
	%33 = add i64 1, 0
	%34 = inttoptr i64 %32 to ptr
	store i64 %33, ptr %34, align 8
	%35  = add i64 %33, 0; bloody hack
	br label %.L42
.L42:
	%36 = getelementptr i64, ptr %.TMP1, i64 0
	%37 = ptrtoint ptr %36 to i64
	%38 = inttoptr i64 %37 to ptr
	%39 = load i64, ptr %38, align 8
	%40 = sub i64 %39, 0
	%41 = icmp eq i64 %40, 0
	br i1 %41, label %.L41, label %.L47
.L47:
	%42 = load i64, ptr %s1, align 8
	; load constant 1 into %43
	%43 = add i64 1, 0
	%44 = add i64 %42, %43
	%45 = getelementptr i64, ptr %s1, i64 0
	%46 = ptrtoint ptr %45 to i64
	%47 = inttoptr i64 %46 to ptr
	store i64 %44, ptr %47, align 8
	%48  = add i64 %44, 0; bloody hack
	store i64 %44, ptr %2, align 8
	%49 = load i64, ptr %s2, align 8
	; load constant 1 into %50
	%50 = add i64 1, 0
	%51 = add i64 %49, %50
	%52 = getelementptr i64, ptr %s2, i64 0
	%53 = ptrtoint ptr %52 to i64
	%54 = inttoptr i64 %53 to ptr
	store i64 %51, ptr %54, align 8
	%55  = add i64 %51, 0; bloody hack
	store i64 %51, ptr %2, align 8
	br label %.L40
.L41:
	%56 = load i64, ptr %s1, align 8
	%57 = inttoptr i64 %56 to ptr
	%58 = load i8, ptr %57, align 8
	%59 = zext i8 %58 to i64
	%60 = load i64, ptr %s2, align 8
	%61 = inttoptr i64 %60 to ptr
	%62 = load i8, ptr %61, align 8
	%63 = zext i8 %62 to i64
	%64 = sub i64 %59, %63
	store i64 %64, ptr %2, align 8
	br label %.L48
.L48:
	%65= load i64, ptr %2, align 8
	ret i64 %65
}

; function strlen
define i64 @strlen(i64 %0) {
.L49:
	%s = alloca i64, align 8
	store i64 %0, ptr %s, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%n = alloca i64, align 8
	; load constant 0 into %2
	%2 = add i64 0, 0
	%3 = getelementptr i64, ptr %n, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %1, align 8
	br label %.L50
.L50:
	%7 = load i64, ptr %s, align 8
	%8 = inttoptr i64 %7 to ptr
	%9 = load i8, ptr %8, align 8
	%10 = zext i8 %9 to i64
	%11 = sub i64 %10, 0
	%12 = icmp eq i64 %11, 0
	br i1 %12, label %.L51, label %.L52
.L52:
	%13 = load i64, ptr %n, align 8
	; load constant 1 into %14
	%14 = add i64 1, 0
	%15 = add i64 %13, %14
	%16 = getelementptr i64, ptr %n, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = inttoptr i64 %17 to ptr
	store i64 %15, ptr %18, align 8
	%19  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %1, align 8
	%20 = load i64, ptr %s, align 8
	; load constant 1 into %21
	%21 = add i64 1, 0
	%22 = add i64 %20, %21
	%23 = getelementptr i64, ptr %s, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = inttoptr i64 %24 to ptr
	store i64 %22, ptr %25, align 8
	%26  = add i64 %22, 0; bloody hack
	store i64 %22, ptr %1, align 8
	br label %.L50
.L51:
	%27 = load i64, ptr %n, align 8
	store i64 %27, ptr %1, align 8
	br label %.L53
.L53:
	%28= load i64, ptr %1, align 8
	ret i64 %28
}

; function UStrCreate
define i64 @UStrCreate(i64 %0) {
.L54:
	%s = alloca i64, align 8
	store i64 %0, ptr %s, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%ustr = alloca i64, align 8
	; load constant 0 into %2
	%2 = add i64 0, 0
	%3 = getelementptr i64, ptr %ustr, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %1, align 8
	%n = alloca i64, align 8
	%7 = load i64, ptr @ustrList, align 8
	%8 = getelementptr i64, ptr %n, i64 0
	%9 = ptrtoint ptr %8 to i64
	%10 = inttoptr i64 %9 to ptr
	store i64 %7, ptr %10, align 8
	%11  = add i64 %7, 0; bloody hack
	store i64 %7, ptr %1, align 8
	br label %.L55
.L55:
	%12 = load i64, ptr %n, align 8
	%13 = sub i64 %12, 0
	%14 = icmp eq i64 %13, 0
	br i1 %14, label %.L56, label %.L57
.L57:
	%15 = load i64, ptr %s, align 8
	%16 = load i64, ptr %n, align 8
	; load constant 8 into %17
	%17 = add i64 8, 0
	%18 = add i64 %16, %17
	%19 = call i64 @strcmp(i64 %18, i64 %15)
	; load constant 0 into %20
	%20 = add i64 0, 0
	%21 = icmp eq i64 %19, %20
	%22 = zext i1 %21 to i64
	%23 = sub i64 %22, 0
	%24 = icmp eq i64 %23, 0
	br i1 %24, label %.L59, label %.L60
.L60:
	%25 = load i64, ptr %n, align 8
	; load constant 8 into %26
	%26 = add i64 8, 0
	%27 = add i64 %25, %26
	%28 = getelementptr i64, ptr %ustr, i64 0
	%29 = ptrtoint ptr %28 to i64
	%30 = inttoptr i64 %29 to ptr
	store i64 %27, ptr %30, align 8
	%31  = add i64 %27, 0; bloody hack
	store i64 %27, ptr %1, align 8
	; load constant 0 into %32
	%32 = add i64 0, 0
	%33 = getelementptr i64, ptr %n, i64 0
	%34 = ptrtoint ptr %33 to i64
	%35 = inttoptr i64 %34 to ptr
	store i64 %32, ptr %35, align 8
	%36  = add i64 %32, 0; bloody hack
	store i64 %32, ptr %1, align 8
	br label %.L58
.L59:
	%37 = load i64, ptr %n, align 8
	%38 = inttoptr i64 %37 to ptr
	%39 = load i64, ptr %38, align 8
	%40 = getelementptr i64, ptr %n, i64 0
	%41 = ptrtoint ptr %40 to i64
	%42 = inttoptr i64 %41 to ptr
	store i64 %39, ptr %42, align 8
	%43  = add i64 %39, 0; bloody hack
	store i64 %39, ptr %1, align 8
	br label %.L58
.L58:
	br label %.L55
.L56:
	%44 = load i64, ptr %ustr, align 8
	; load constant 0 into %45
	%45 = add i64 0, 0
	%46 = icmp eq i64 %44, %45
	%47 = zext i1 %46 to i64
	%48 = sub i64 %47, 0
	%49 = icmp eq i64 %48, 0
	br i1 %49, label %.L62, label %.L63
.L63:
	; load constant 8 into %50
	%50 = add i64 8, 0
	%51 = load i64, ptr %s, align 8
	%52 = call i64 @strlen(i64 %51)
	%53 = add i64 %50, %52
	; load constant 1 into %54
	%54 = add i64 1, 0
	%55 = add i64 %53, %54
	%56 = call i64 @malloc(i64 %55)
	%57 = getelementptr i64, ptr %n, i64 0
	%58 = ptrtoint ptr %57 to i64
	%59 = inttoptr i64 %58 to ptr
	store i64 %56, ptr %59, align 8
	%60  = add i64 %56, 0; bloody hack
	store i64 %56, ptr %1, align 8
	%61 = load i64, ptr @ustrList, align 8
	%62 = load i64, ptr %n, align 8
	%63 = inttoptr i64 %62 to ptr
	store i64 %61, ptr %63, align 8
	%64  = add i64 %61, 0; bloody hack
	store i64 %61, ptr %1, align 8
	%65 = load i64, ptr %s, align 8
	%66 = load i64, ptr %n, align 8
	; load constant 8 into %67
	%67 = add i64 8, 0
	%68 = add i64 %66, %67
	%69 = call i64 @strcpy(i64 %68, i64 %65)
	store i64 %69, ptr %1, align 8
	%70 = load i64, ptr %n, align 8
	%71 = getelementptr i64, ptr @ustrList, i64 0
	%72 = ptrtoint ptr %71 to i64
	%73 = inttoptr i64 %72 to ptr
	store i64 %70, ptr %73, align 8
	%74  = add i64 %70, 0; bloody hack
	store i64 %70, ptr %1, align 8
	%75 = load i64, ptr %n, align 8
	; load constant 8 into %76
	%76 = add i64 8, 0
	%77 = add i64 %75, %76
	%78 = getelementptr i64, ptr %ustr, i64 0
	%79 = ptrtoint ptr %78 to i64
	%80 = inttoptr i64 %79 to ptr
	store i64 %77, ptr %80, align 8
	%81  = add i64 %77, 0; bloody hack
	store i64 %77, ptr %1, align 8
	br label %.L61
.L62:
	br label %.L61
.L61:
	%82 = load i64, ptr %ustr, align 8
	store i64 %82, ptr %1, align 8
	br label %.L64
.L64:
	%83= load i64, ptr %1, align 8
	ret i64 %83
}

; function testUStr
define i64 @testUStr() {
.L65:
	%0 = alloca i64, align 8 ; ptr to ret val
	%s1 = alloca i64, align 8
	%s2 = alloca i64, align 8
	%s3 = alloca i64, align 8
	%1 = getelementptr i64, ptr @.STR0, i64 0
	%2 = ptrtoint ptr %1 to i64
	%3 = call i64 @UStrCreate(i64 %2)
	%4 = getelementptr i64, ptr %s1, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %0, align 8
	%8 = load i64, ptr %s1, align 8
	%9 = call i64 @printInt(i64 %8)
	store i64 %9, ptr %0, align 8
	%10 = getelementptr i64, ptr @.STR1, i64 0
	%11 = ptrtoint ptr %10 to i64
	%12 = call i64 @print(i64 %11)
	store i64 %12, ptr %0, align 8
	%13 = load i64, ptr %s1, align 8
	%14 = call i64 @print(i64 %13)
	store i64 %14, ptr %0, align 8
	%15 = getelementptr i64, ptr @.STR2, i64 0
	%16 = ptrtoint ptr %15 to i64
	%17 = call i64 @println(i64 %16)
	store i64 %17, ptr %0, align 8
	%18 = getelementptr i64, ptr @.STR3, i64 0
	%19 = ptrtoint ptr %18 to i64
	%20 = call i64 @UStrCreate(i64 %19)
	%21 = getelementptr i64, ptr %s2, i64 0
	%22 = ptrtoint ptr %21 to i64
	%23 = inttoptr i64 %22 to ptr
	store i64 %20, ptr %23, align 8
	%24  = add i64 %20, 0; bloody hack
	store i64 %20, ptr %0, align 8
	%25 = load i64, ptr %s2, align 8
	%26 = call i64 @printInt(i64 %25)
	store i64 %26, ptr %0, align 8
	%27 = getelementptr i64, ptr @.STR4, i64 0
	%28 = ptrtoint ptr %27 to i64
	%29 = call i64 @print(i64 %28)
	store i64 %29, ptr %0, align 8
	%30 = load i64, ptr %s2, align 8
	%31 = call i64 @print(i64 %30)
	store i64 %31, ptr %0, align 8
	%32 = getelementptr i64, ptr @.STR5, i64 0
	%33 = ptrtoint ptr %32 to i64
	%34 = call i64 @println(i64 %33)
	store i64 %34, ptr %0, align 8
	%35 = getelementptr i64, ptr @.STR6, i64 0
	%36 = ptrtoint ptr %35 to i64
	%37 = call i64 @UStrCreate(i64 %36)
	%38 = getelementptr i64, ptr %s3, i64 0
	%39 = ptrtoint ptr %38 to i64
	%40 = inttoptr i64 %39 to ptr
	store i64 %37, ptr %40, align 8
	%41  = add i64 %37, 0; bloody hack
	store i64 %37, ptr %0, align 8
	%42 = load i64, ptr %s3, align 8
	%43 = call i64 @printInt(i64 %42)
	store i64 %43, ptr %0, align 8
	%44 = getelementptr i64, ptr @.STR7, i64 0
	%45 = ptrtoint ptr %44 to i64
	%46 = call i64 @print(i64 %45)
	store i64 %46, ptr %0, align 8
	%47 = load i64, ptr %s3, align 8
	%48 = call i64 @print(i64 %47)
	store i64 %48, ptr %0, align 8
	%49 = getelementptr i64, ptr @.STR8, i64 0
	%50 = ptrtoint ptr %49 to i64
	%51 = call i64 @println(i64 %50)
	store i64 %51, ptr %0, align 8
	br label %.L66
.L66:
	%52= load i64, ptr %0, align 8
	ret i64 %52
}

@.STR8 = global [3 x i8] c"'.\00", align 8
@.STR7 = global [23 x i8] c" is address for ustr '\00", align 8
@.STR6 = global [6 x i8] c"hallo\00", align 8
@.STR5 = global [3 x i8] c"'.\00", align 8
@.STR4 = global [23 x i8] c" is address for ustr '\00", align 8
@.STR3 = global [6 x i8] c"hello\00", align 8
@.STR2 = global [3 x i8] c"'.\00", align 8
@.STR1 = global [23 x i8] c" is address for ustr '\00", align 8
@.STR0 = global [6 x i8] c"hallo\00", align 8
; function initLexer
define i64 @initLexer() {
.L67:
	%0 = alloca i64, align 8 ; ptr to ret val
	; load constant 256 into %1
	%1 = add i64 256, 0
	%2 = getelementptr i64, ptr @lexerInternalValCapacity, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = inttoptr i64 %3 to ptr
	store i64 %1, ptr %4, align 8
	%5  = add i64 %1, 0; bloody hack
	store i64 %1, ptr %0, align 8
	%6 = load i64, ptr @lexerInternalValCapacity, align 8
	%7 = call i64 @malloc(i64 %6)
	%8 = getelementptr i64, ptr @lexerInternalVal, i64 0
	%9 = ptrtoint ptr %8 to i64
	%10 = inttoptr i64 %9 to ptr
	store i64 %7, ptr %10, align 8
	%11  = add i64 %7, 0; bloody hack
	store i64 %7, ptr %0, align 8
	; load constant 1 into %12
	%12 = add i64 1, 0
	%13 = getelementptr i64, ptr @lexerCurrentRow, i64 0
	%14 = ptrtoint ptr %13 to i64
	%15 = inttoptr i64 %14 to ptr
	store i64 %12, ptr %15, align 8
	%16  = add i64 %12, 0; bloody hack
	store i64 %12, ptr %0, align 8
	; load constant 0 into %17
	%17 = add i64 0, 0
	%18 = getelementptr i64, ptr @lexerCurrentCol, i64 0
	%19 = ptrtoint ptr %18 to i64
	%20 = inttoptr i64 %19 to ptr
	store i64 %17, ptr %20, align 8
	%21  = add i64 %17, 0; bloody hack
	store i64 %17, ptr %0, align 8
	%22 = getelementptr i64, ptr @.STR9, i64 0
	%23 = ptrtoint ptr %22 to i64
	%24 = call i64 @UStrCreate(i64 %23)
	%25 = getelementptr i64, ptr @kw_if, i64 0
	%26 = ptrtoint ptr %25 to i64
	%27 = inttoptr i64 %26 to ptr
	store i64 %24, ptr %27, align 8
	%28  = add i64 %24, 0; bloody hack
	store i64 %24, ptr %0, align 8
	%29 = getelementptr i64, ptr @.STR10, i64 0
	%30 = ptrtoint ptr %29 to i64
	%31 = call i64 @UStrCreate(i64 %30)
	%32 = getelementptr i64, ptr @kw_while, i64 0
	%33 = ptrtoint ptr %32 to i64
	%34 = inttoptr i64 %33 to ptr
	store i64 %31, ptr %34, align 8
	%35  = add i64 %31, 0; bloody hack
	store i64 %31, ptr %0, align 8
	%36 = getelementptr i64, ptr @.STR11, i64 0
	%37 = ptrtoint ptr %36 to i64
	%38 = call i64 @UStrCreate(i64 %37)
	%39 = getelementptr i64, ptr @kw_global, i64 0
	%40 = ptrtoint ptr %39 to i64
	%41 = inttoptr i64 %40 to ptr
	store i64 %38, ptr %41, align 8
	%42  = add i64 %38, 0; bloody hack
	store i64 %38, ptr %0, align 8
	%43 = getelementptr i64, ptr @.STR12, i64 0
	%44 = ptrtoint ptr %43 to i64
	%45 = call i64 @UStrCreate(i64 %44)
	%46 = getelementptr i64, ptr @kw_local, i64 0
	%47 = ptrtoint ptr %46 to i64
	%48 = inttoptr i64 %47 to ptr
	store i64 %45, ptr %48, align 8
	%49  = add i64 %45, 0; bloody hack
	store i64 %45, ptr %0, align 8
	%50 = getelementptr i64, ptr @.STR13, i64 0
	%51 = ptrtoint ptr %50 to i64
	%52 = call i64 @UStrCreate(i64 %51)
	%53 = getelementptr i64, ptr @kw_else, i64 0
	%54 = ptrtoint ptr %53 to i64
	%55 = inttoptr i64 %54 to ptr
	store i64 %52, ptr %55, align 8
	%56  = add i64 %52, 0; bloody hack
	store i64 %52, ptr %0, align 8
	%57 = getelementptr i64, ptr @.STR14, i64 0
	%58 = ptrtoint ptr %57 to i64
	%59 = call i64 @UStrCreate(i64 %58)
	%60 = getelementptr i64, ptr @kw_do, i64 0
	%61 = ptrtoint ptr %60 to i64
	%62 = inttoptr i64 %61 to ptr
	store i64 %59, ptr %62, align 8
	%63  = add i64 %59, 0; bloody hack
	store i64 %59, ptr %0, align 8
	%64 = getelementptr i64, ptr @.STR15, i64 0
	%65 = ptrtoint ptr %64 to i64
	%66 = call i64 @UStrCreate(i64 %65)
	%67 = getelementptr i64, ptr @kw_fn, i64 0
	%68 = ptrtoint ptr %67 to i64
	%69 = inttoptr i64 %68 to ptr
	store i64 %66, ptr %69, align 8
	%70  = add i64 %66, 0; bloody hack
	store i64 %66, ptr %0, align 8
	%71 = getelementptr i64, ptr @.STR16, i64 0
	%72 = ptrtoint ptr %71 to i64
	%73 = getelementptr i64, ptr @token, i64 0
	%74 = ptrtoint ptr %73 to i64
	%75 = inttoptr i64 %74 to ptr
	store i64 %72, ptr %75, align 8
	%76  = add i64 %72, 0; bloody hack
	store i64 %72, ptr %0, align 8
	br label %.L68
.L68:
	%77= load i64, ptr %0, align 8
	ret i64 %77
}

@.STR16 = global [33 x i8] c"[kind  ][val   ][row   ][col   ]\00", align 8
@.STR15 = global [3 x i8] c"fn\00", align 8
@.STR14 = global [3 x i8] c"do\00", align 8
@.STR13 = global [5 x i8] c"else\00", align 8
@.STR12 = global [6 x i8] c"local\00", align 8
@.STR11 = global [7 x i8] c"global\00", align 8
@.STR10 = global [6 x i8] c"while\00", align 8
@.STR9 = global [3 x i8] c"if\00", align 8
; function nextCh
define i64 @nextCh() {
.L69:
	%0 = alloca i64, align 8 ; ptr to ret val
	%1 = load i64, ptr @lexerUpdateVal, align 8
	%2 = sub i64 %1, 0
	%3 = icmp eq i64 %2, 0
	br i1 %3, label %.L71, label %.L72
.L72:
	%4 = load i64, ptr @lexerLengthVal, align 8
	; load constant 1 into %5
	%5 = add i64 1, 0
	%6 = add i64 %4, %5
	%7 = load i64, ptr @lexerInternalValCapacity, align 8
	%8 = icmp sgt i64 %6, %7
	%9 = zext i1 %8 to i64
	%10 = sub i64 %9, 0
	%11 = icmp eq i64 %10, 0
	br i1 %11, label %.L74, label %.L75
.L75:
	%12 = getelementptr i64, ptr @.STR17, i64 0
	%13 = ptrtoint ptr %12 to i64
	%14 = call i64 @println(i64 %13)
	store i64 %14, ptr %0, align 8
	br label %.L73
.L74:
	br label %.L73
.L73:
	%15 = load i64, ptr @lexerCh, align 8
	%16 = load i64, ptr @lexerInternalVal, align 8
	%17 = load i64, ptr @lexerLengthVal, align 8
	%18 = add i64 %16, %17
	%19 = inttoptr i64 %18 to ptr
	%20 = trunc i64 %15 to i8
	store i8 %20, ptr %19, align 8
	%21  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %0, align 8
	%22 = load i64, ptr @lexerLengthVal, align 8
	; load constant 1 into %23
	%23 = add i64 1, 0
	%24 = add i64 %22, %23
	%25 = getelementptr i64, ptr @lexerLengthVal, i64 0
	%26 = ptrtoint ptr %25 to i64
	%27 = inttoptr i64 %26 to ptr
	store i64 %24, ptr %27, align 8
	%28  = add i64 %24, 0; bloody hack
	store i64 %24, ptr %0, align 8
	; load constant 0 into %29
	%29 = add i64 0, 0
	%30 = load i64, ptr @lexerInternalVal, align 8
	%31 = load i64, ptr @lexerLengthVal, align 8
	%32 = add i64 %30, %31
	%33 = inttoptr i64 %32 to ptr
	%34 = trunc i64 %29 to i8
	store i8 %34, ptr %33, align 8
	%35  = add i64 %29, 0; bloody hack
	store i64 %29, ptr %0, align 8
	br label %.L70
.L71:
	; load constant 0 into %36
	%36 = add i64 0, 0
	%37 = getelementptr i64, ptr @lexerLengthVal, i64 0
	%38 = ptrtoint ptr %37 to i64
	%39 = inttoptr i64 %38 to ptr
	store i64 %36, ptr %39, align 8
	%40  = add i64 %36, 0; bloody hack
	store i64 %36, ptr %0, align 8
	br label %.L70
.L70:
	%41 = call i32 @getchar()
	%42 = sext i32 %41 to i64
	%43 = getelementptr i64, ptr @lexerCh, i64 0
	%44 = ptrtoint ptr %43 to i64
	%45 = inttoptr i64 %44 to ptr
	store i64 %42, ptr %45, align 8
	%46  = add i64 %42, 0; bloody hack
	store i64 %42, ptr %0, align 8
	%47 = load i64, ptr @lexerCh, align 8
	; load constant '\n' into %48
	%48 = add i64 10, 0
	%49 = icmp eq i64 %47, %48
	%50 = zext i1 %49 to i64
	%51 = sub i64 %50, 0
	%52 = icmp eq i64 %51, 0
	br i1 %52, label %.L77, label %.L78
.L78:
	%53 = load i64, ptr @lexerCurrentRow, align 8
	; load constant 1 into %54
	%54 = add i64 1, 0
	%55 = add i64 %53, %54
	%56 = getelementptr i64, ptr @lexerCurrentRow, i64 0
	%57 = ptrtoint ptr %56 to i64
	%58 = inttoptr i64 %57 to ptr
	store i64 %55, ptr %58, align 8
	%59  = add i64 %55, 0; bloody hack
	store i64 %55, ptr %0, align 8
	; load constant 0 into %60
	%60 = add i64 0, 0
	%61 = getelementptr i64, ptr @lexerCurrentCol, i64 0
	%62 = ptrtoint ptr %61 to i64
	%63 = inttoptr i64 %62 to ptr
	store i64 %60, ptr %63, align 8
	%64  = add i64 %60, 0; bloody hack
	store i64 %60, ptr %0, align 8
	br label %.L76
.L77:
	%65 = load i64, ptr @lexerCurrentCol, align 8
	; load constant 1 into %66
	%66 = add i64 1, 0
	%67 = add i64 %65, %66
	%68 = getelementptr i64, ptr @lexerCurrentCol, i64 0
	%69 = ptrtoint ptr %68 to i64
	%70 = inttoptr i64 %69 to ptr
	store i64 %67, ptr %70, align 8
	%71  = add i64 %67, 0; bloody hack
	store i64 %67, ptr %0, align 8
	br label %.L76
.L76:
	br label %.L79
.L79:
	%72= load i64, ptr %0, align 8
	ret i64 %72
}

@.STR17 = global [22 x i8] c"TODO: support realloc\00", align 8
; function isDigit
define i64 @isDigit(i64 %0) {
.L80:
	%ch = alloca i64, align 8
	store i64 %0, ptr %ch, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%.TMP2 = alloca i64, align 8
	%2 = load i64, ptr %ch, align 8
	; load constant '0' into %3
	%3 = add i64 48, 0
	%4 = icmp sge i64 %2, %3
	%5 = zext i1 %4 to i64
	%6 = sub i64 %5, 0
	%7 = icmp ne i64 %6, 0
	br i1 %7, label %.L82, label %.L84
.L84:
	%8 = getelementptr i64, ptr %.TMP2, i64 0
	%9 = ptrtoint ptr %8 to i64
	; load constant 0 into %10
	%10 = add i64 0, 0
	%11 = inttoptr i64 %9 to ptr
	store i64 %10, ptr %11, align 8
	%12  = add i64 %10, 0; bloody hack
	; jump to end
	br label %.L81
.L82:
	%13 = load i64, ptr %ch, align 8
	; load constant '9' into %14
	%14 = add i64 57, 0
	%15 = icmp sle i64 %13, %14
	%16 = zext i1 %15 to i64
	%17 = sub i64 %16, 0
	%18 = icmp ne i64 %17, 0
	br i1 %18, label %.L83, label %.L85
.L85:
	%19 = getelementptr i64, ptr %.TMP2, i64 0
	%20 = ptrtoint ptr %19 to i64
	; load constant 0 into %21
	%21 = add i64 0, 0
	%22 = inttoptr i64 %20 to ptr
	store i64 %21, ptr %22, align 8
	%23  = add i64 %21, 0; bloody hack
	; jump to end
	br label %.L81
.L83:
	%24 = getelementptr i64, ptr %.TMP2, i64 0
	%25 = ptrtoint ptr %24 to i64
	; load constant 1 into %26
	%26 = add i64 1, 0
	%27 = inttoptr i64 %25 to ptr
	store i64 %26, ptr %27, align 8
	%28  = add i64 %26, 0; bloody hack
	br label %.L81
.L81:
	%29 = getelementptr i64, ptr %.TMP2, i64 0
	%30 = ptrtoint ptr %29 to i64
	%31 = inttoptr i64 %30 to ptr
	%32 = load i64, ptr %31, align 8
	store i64 %32, ptr %1, align 8
	br label %.L86
.L86:
	%33= load i64, ptr %1, align 8
	ret i64 %33
}

; function isLetter
define i64 @isLetter(i64 %0) {
.L87:
	%ch = alloca i64, align 8
	store i64 %0, ptr %ch, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%.TMP3 = alloca i64, align 8
	%.TMP4 = alloca i64, align 8
	%.TMP5 = alloca i64, align 8
	%2 = load i64, ptr %ch, align 8
	; load constant 'a' into %3
	%3 = add i64 97, 0
	%4 = icmp sge i64 %2, %3
	%5 = zext i1 %4 to i64
	%6 = sub i64 %5, 0
	%7 = icmp ne i64 %6, 0
	br i1 %7, label %.L95, label %.L97
.L97:
	%8 = getelementptr i64, ptr %.TMP5, i64 0
	%9 = ptrtoint ptr %8 to i64
	; load constant 0 into %10
	%10 = add i64 0, 0
	%11 = inttoptr i64 %9 to ptr
	store i64 %10, ptr %11, align 8
	%12  = add i64 %10, 0; bloody hack
	; jump to end
	br label %.L94
.L95:
	%13 = load i64, ptr %ch, align 8
	; load constant 'z' into %14
	%14 = add i64 122, 0
	%15 = icmp sle i64 %13, %14
	%16 = zext i1 %15 to i64
	%17 = sub i64 %16, 0
	%18 = icmp ne i64 %17, 0
	br i1 %18, label %.L96, label %.L98
.L98:
	%19 = getelementptr i64, ptr %.TMP5, i64 0
	%20 = ptrtoint ptr %19 to i64
	; load constant 0 into %21
	%21 = add i64 0, 0
	%22 = inttoptr i64 %20 to ptr
	store i64 %21, ptr %22, align 8
	%23  = add i64 %21, 0; bloody hack
	; jump to end
	br label %.L94
.L96:
	%24 = getelementptr i64, ptr %.TMP5, i64 0
	%25 = ptrtoint ptr %24 to i64
	; load constant 1 into %26
	%26 = add i64 1, 0
	%27 = inttoptr i64 %25 to ptr
	store i64 %26, ptr %27, align 8
	%28  = add i64 %26, 0; bloody hack
	br label %.L94
.L94:
	%29 = getelementptr i64, ptr %.TMP5, i64 0
	%30 = ptrtoint ptr %29 to i64
	%31 = inttoptr i64 %30 to ptr
	%32 = load i64, ptr %31, align 8
	%33 = sub i64 %32, 0
	%34 = icmp eq i64 %33, 0
	br i1 %34, label %.L92, label %.L99
.L99:
	%35 = getelementptr i64, ptr %.TMP4, i64 0
	%36 = ptrtoint ptr %35 to i64
	; load constant 1 into %37
	%37 = add i64 1, 0
	%38 = inttoptr i64 %36 to ptr
	store i64 %37, ptr %38, align 8
	%39  = add i64 %37, 0; bloody hack
	br label %.L91
.L92:
	%.TMP6 = alloca i64, align 8
	%40 = load i64, ptr %ch, align 8
	; load constant 'A' into %41
	%41 = add i64 65, 0
	%42 = icmp sge i64 %40, %41
	%43 = zext i1 %42 to i64
	%44 = sub i64 %43, 0
	%45 = icmp ne i64 %44, 0
	br i1 %45, label %.L101, label %.L103
.L103:
	%46 = getelementptr i64, ptr %.TMP6, i64 0
	%47 = ptrtoint ptr %46 to i64
	; load constant 0 into %48
	%48 = add i64 0, 0
	%49 = inttoptr i64 %47 to ptr
	store i64 %48, ptr %49, align 8
	%50  = add i64 %48, 0; bloody hack
	; jump to end
	br label %.L100
.L101:
	%51 = load i64, ptr %ch, align 8
	; load constant 'Z' into %52
	%52 = add i64 90, 0
	%53 = icmp sle i64 %51, %52
	%54 = zext i1 %53 to i64
	%55 = sub i64 %54, 0
	%56 = icmp ne i64 %55, 0
	br i1 %56, label %.L102, label %.L104
.L104:
	%57 = getelementptr i64, ptr %.TMP6, i64 0
	%58 = ptrtoint ptr %57 to i64
	; load constant 0 into %59
	%59 = add i64 0, 0
	%60 = inttoptr i64 %58 to ptr
	store i64 %59, ptr %60, align 8
	%61  = add i64 %59, 0; bloody hack
	; jump to end
	br label %.L100
.L102:
	%62 = getelementptr i64, ptr %.TMP6, i64 0
	%63 = ptrtoint ptr %62 to i64
	; load constant 1 into %64
	%64 = add i64 1, 0
	%65 = inttoptr i64 %63 to ptr
	store i64 %64, ptr %65, align 8
	%66  = add i64 %64, 0; bloody hack
	br label %.L100
.L100:
	%67 = getelementptr i64, ptr %.TMP6, i64 0
	%68 = ptrtoint ptr %67 to i64
	%69 = inttoptr i64 %68 to ptr
	%70 = load i64, ptr %69, align 8
	%71 = sub i64 %70, 0
	%72 = icmp ne i64 %71, 0
	br i1 %72, label %.L93, label %.L105
.L105:
	%73 = getelementptr i64, ptr %.TMP4, i64 0
	%74 = ptrtoint ptr %73 to i64
	; load constant 0 into %75
	%75 = add i64 0, 0
	%76 = inttoptr i64 %74 to ptr
	store i64 %75, ptr %76, align 8
	%77  = add i64 %75, 0; bloody hack
	br label %.L91
.L93:
	%78 = getelementptr i64, ptr %.TMP4, i64 0
	%79 = ptrtoint ptr %78 to i64
	; load constant 1 into %80
	%80 = add i64 1, 0
	%81 = inttoptr i64 %79 to ptr
	store i64 %80, ptr %81, align 8
	%82  = add i64 %80, 0; bloody hack
	br label %.L91
.L91:
	%83 = getelementptr i64, ptr %.TMP4, i64 0
	%84 = ptrtoint ptr %83 to i64
	%85 = inttoptr i64 %84 to ptr
	%86 = load i64, ptr %85, align 8
	%87 = sub i64 %86, 0
	%88 = icmp eq i64 %87, 0
	br i1 %88, label %.L89, label %.L106
.L106:
	%89 = getelementptr i64, ptr %.TMP3, i64 0
	%90 = ptrtoint ptr %89 to i64
	; load constant 1 into %91
	%91 = add i64 1, 0
	%92 = inttoptr i64 %90 to ptr
	store i64 %91, ptr %92, align 8
	%93  = add i64 %91, 0; bloody hack
	br label %.L88
.L89:
	%94 = load i64, ptr %ch, align 8
	; load constant '_' into %95
	%95 = add i64 95, 0
	%96 = icmp eq i64 %94, %95
	%97 = zext i1 %96 to i64
	%98 = sub i64 %97, 0
	%99 = icmp ne i64 %98, 0
	br i1 %99, label %.L90, label %.L107
.L107:
	%100 = getelementptr i64, ptr %.TMP3, i64 0
	%101 = ptrtoint ptr %100 to i64
	; load constant 0 into %102
	%102 = add i64 0, 0
	%103 = inttoptr i64 %101 to ptr
	store i64 %102, ptr %103, align 8
	%104  = add i64 %102, 0; bloody hack
	br label %.L88
.L90:
	%105 = getelementptr i64, ptr %.TMP3, i64 0
	%106 = ptrtoint ptr %105 to i64
	; load constant 1 into %107
	%107 = add i64 1, 0
	%108 = inttoptr i64 %106 to ptr
	store i64 %107, ptr %108, align 8
	%109  = add i64 %107, 0; bloody hack
	br label %.L88
.L88:
	%110 = getelementptr i64, ptr %.TMP3, i64 0
	%111 = ptrtoint ptr %110 to i64
	%112 = inttoptr i64 %111 to ptr
	%113 = load i64, ptr %112, align 8
	store i64 %113, ptr %1, align 8
	br label %.L108
.L108:
	%114= load i64, ptr %1, align 8
	ret i64 %114
}

; function isWhitespace
define i64 @isWhitespace(i64 %0) {
.L109:
	%ch = alloca i64, align 8
	store i64 %0, ptr %ch, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%.TMP7 = alloca i64, align 8
	%.TMP8 = alloca i64, align 8
	%2 = load i64, ptr %ch, align 8
	; load constant ' ' into %3
	%3 = add i64 32, 0
	%4 = icmp eq i64 %2, %3
	%5 = zext i1 %4 to i64
	%6 = sub i64 %5, 0
	%7 = icmp eq i64 %6, 0
	br i1 %7, label %.L114, label %.L116
.L116:
	%8 = getelementptr i64, ptr %.TMP8, i64 0
	%9 = ptrtoint ptr %8 to i64
	; load constant 1 into %10
	%10 = add i64 1, 0
	%11 = inttoptr i64 %9 to ptr
	store i64 %10, ptr %11, align 8
	%12  = add i64 %10, 0; bloody hack
	br label %.L113
.L114:
	%13 = load i64, ptr %ch, align 8
	; load constant '\n' into %14
	%14 = add i64 10, 0
	%15 = icmp eq i64 %13, %14
	%16 = zext i1 %15 to i64
	%17 = sub i64 %16, 0
	%18 = icmp ne i64 %17, 0
	br i1 %18, label %.L115, label %.L117
.L117:
	%19 = getelementptr i64, ptr %.TMP8, i64 0
	%20 = ptrtoint ptr %19 to i64
	; load constant 0 into %21
	%21 = add i64 0, 0
	%22 = inttoptr i64 %20 to ptr
	store i64 %21, ptr %22, align 8
	%23  = add i64 %21, 0; bloody hack
	br label %.L113
.L115:
	%24 = getelementptr i64, ptr %.TMP8, i64 0
	%25 = ptrtoint ptr %24 to i64
	; load constant 1 into %26
	%26 = add i64 1, 0
	%27 = inttoptr i64 %25 to ptr
	store i64 %26, ptr %27, align 8
	%28  = add i64 %26, 0; bloody hack
	br label %.L113
.L113:
	%29 = getelementptr i64, ptr %.TMP8, i64 0
	%30 = ptrtoint ptr %29 to i64
	%31 = inttoptr i64 %30 to ptr
	%32 = load i64, ptr %31, align 8
	%33 = sub i64 %32, 0
	%34 = icmp eq i64 %33, 0
	br i1 %34, label %.L111, label %.L118
.L118:
	%35 = getelementptr i64, ptr %.TMP7, i64 0
	%36 = ptrtoint ptr %35 to i64
	; load constant 1 into %37
	%37 = add i64 1, 0
	%38 = inttoptr i64 %36 to ptr
	store i64 %37, ptr %38, align 8
	%39  = add i64 %37, 0; bloody hack
	br label %.L110
.L111:
	%40 = load i64, ptr %ch, align 8
	; load constant '\t' into %41
	%41 = add i64 9, 0
	%42 = icmp eq i64 %40, %41
	%43 = zext i1 %42 to i64
	%44 = sub i64 %43, 0
	%45 = icmp ne i64 %44, 0
	br i1 %45, label %.L112, label %.L119
.L119:
	%46 = getelementptr i64, ptr %.TMP7, i64 0
	%47 = ptrtoint ptr %46 to i64
	; load constant 0 into %48
	%48 = add i64 0, 0
	%49 = inttoptr i64 %47 to ptr
	store i64 %48, ptr %49, align 8
	%50  = add i64 %48, 0; bloody hack
	br label %.L110
.L112:
	%51 = getelementptr i64, ptr %.TMP7, i64 0
	%52 = ptrtoint ptr %51 to i64
	; load constant 1 into %53
	%53 = add i64 1, 0
	%54 = inttoptr i64 %52 to ptr
	store i64 %53, ptr %54, align 8
	%55  = add i64 %53, 0; bloody hack
	br label %.L110
.L110:
	%56 = getelementptr i64, ptr %.TMP7, i64 0
	%57 = ptrtoint ptr %56 to i64
	%58 = inttoptr i64 %57 to ptr
	%59 = load i64, ptr %58, align 8
	store i64 %59, ptr %1, align 8
	br label %.L120
.L120:
	%60= load i64, ptr %1, align 8
	ret i64 %60
}

; function getToken
define i64 @getToken() {
.L121:
	%0 = alloca i64, align 8 ; ptr to ret val
	; load constant 0 into %1
	%1 = add i64 0, 0
	%2 = getelementptr i64, ptr @lexerLengthVal, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = inttoptr i64 %3 to ptr
	store i64 %1, ptr %4, align 8
	%5  = add i64 %1, 0; bloody hack
	store i64 %1, ptr %0, align 8
	; load constant 0 into %6
	%6 = add i64 0, 0
	%7 = getelementptr i64, ptr @lexerUpdateVal, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = inttoptr i64 %8 to ptr
	store i64 %6, ptr %9, align 8
	%10  = add i64 %6, 0; bloody hack
	store i64 %6, ptr %0, align 8
	br label %.L122
.L122:
	%.TMP9 = alloca i64, align 8
	%11 = load i64, ptr @lexerCh, align 8
	; load constant 0 into %12
	%12 = add i64 0, 0
	%13 = icmp eq i64 %11, %12
	%14 = zext i1 %13 to i64
	%15 = sub i64 %14, 0
	%16 = icmp eq i64 %15, 0
	br i1 %16, label %.L125, label %.L127
.L127:
	%17 = getelementptr i64, ptr %.TMP9, i64 0
	%18 = ptrtoint ptr %17 to i64
	; load constant 1 into %19
	%19 = add i64 1, 0
	%20 = inttoptr i64 %18 to ptr
	store i64 %19, ptr %20, align 8
	%21  = add i64 %19, 0; bloody hack
	br label %.L124
.L125:
	%22 = load i64, ptr @lexerCh, align 8
	%23 = call i64 @isWhitespace(i64 %22)
	%24 = sub i64 %23, 0
	%25 = icmp ne i64 %24, 0
	br i1 %25, label %.L126, label %.L128
.L128:
	%26 = getelementptr i64, ptr %.TMP9, i64 0
	%27 = ptrtoint ptr %26 to i64
	; load constant 0 into %28
	%28 = add i64 0, 0
	%29 = inttoptr i64 %27 to ptr
	store i64 %28, ptr %29, align 8
	%30  = add i64 %28, 0; bloody hack
	br label %.L124
.L126:
	%31 = getelementptr i64, ptr %.TMP9, i64 0
	%32 = ptrtoint ptr %31 to i64
	; load constant 1 into %33
	%33 = add i64 1, 0
	%34 = inttoptr i64 %32 to ptr
	store i64 %33, ptr %34, align 8
	%35  = add i64 %33, 0; bloody hack
	br label %.L124
.L124:
	%36 = getelementptr i64, ptr %.TMP9, i64 0
	%37 = ptrtoint ptr %36 to i64
	%38 = inttoptr i64 %37 to ptr
	%39 = load i64, ptr %38, align 8
	%40 = sub i64 %39, 0
	%41 = icmp eq i64 %40, 0
	br i1 %41, label %.L123, label %.L129
.L129:
	%42 = call i64 @nextCh()
	store i64 %42, ptr %0, align 8
	br label %.L122
.L123:
	; load constant 1 into %43
	%43 = add i64 1, 0
	%44 = getelementptr i64, ptr @lexerUpdateVal, i64 0
	%45 = ptrtoint ptr %44 to i64
	%46 = inttoptr i64 %45 to ptr
	store i64 %43, ptr %46, align 8
	%47  = add i64 %43, 0; bloody hack
	store i64 %43, ptr %0, align 8
	%48 = load i64, ptr @lexerCurrentRow, align 8
	%49 = load i64, ptr @token, align 8
	; load constant 16 into %50
	%50 = add i64 16, 0
	%51 = add i64 %49, %50
	%52 = inttoptr i64 %51 to ptr
	store i64 %48, ptr %52, align 8
	%53  = add i64 %48, 0; bloody hack
	store i64 %48, ptr %0, align 8
	%54 = load i64, ptr @lexerCurrentCol, align 8
	%55 = load i64, ptr @token, align 8
	; load constant 24 into %56
	%56 = add i64 24, 0
	%57 = add i64 %55, %56
	%58 = inttoptr i64 %57 to ptr
	store i64 %54, ptr %58, align 8
	%59  = add i64 %54, 0; bloody hack
	store i64 %54, ptr %0, align 8
	%60 = load i64, ptr @lexerCh, align 8
	%61 = call i64 @isDigit(i64 %60)
	%62 = sub i64 %61, 0
	%63 = icmp eq i64 %62, 0
	br i1 %63, label %.L131, label %.L132
.L132:
	br label %.L133
.L133:
	%64 = load i64, ptr @lexerCh, align 8
	%65 = call i64 @isDigit(i64 %64)
	%66 = sub i64 %65, 0
	%67 = icmp eq i64 %66, 0
	br i1 %67, label %.L134, label %.L135
.L135:
	%68 = call i64 @nextCh()
	store i64 %68, ptr %0, align 8
	br label %.L133
.L134:
	; load constant 2 into %69
	%69 = add i64 2, 0
	%70 = load i64, ptr @token, align 8
	%71 = inttoptr i64 %70 to ptr
	store i64 %69, ptr %71, align 8
	%72  = add i64 %69, 0; bloody hack
	store i64 %69, ptr %0, align 8
	br label %.L130
.L131:
	%73 = load i64, ptr @lexerCh, align 8
	%74 = call i64 @isLetter(i64 %73)
	%75 = sub i64 %74, 0
	%76 = icmp eq i64 %75, 0
	br i1 %76, label %.L137, label %.L138
.L138:
	br label %.L139
.L139:
	%.TMP10 = alloca i64, align 8
	%77 = load i64, ptr @lexerCh, align 8
	%78 = call i64 @isLetter(i64 %77)
	%79 = sub i64 %78, 0
	%80 = icmp eq i64 %79, 0
	br i1 %80, label %.L142, label %.L144
.L144:
	%81 = getelementptr i64, ptr %.TMP10, i64 0
	%82 = ptrtoint ptr %81 to i64
	; load constant 1 into %83
	%83 = add i64 1, 0
	%84 = inttoptr i64 %82 to ptr
	store i64 %83, ptr %84, align 8
	%85  = add i64 %83, 0; bloody hack
	br label %.L141
.L142:
	%86 = load i64, ptr @lexerCh, align 8
	%87 = call i64 @isDigit(i64 %86)
	%88 = sub i64 %87, 0
	%89 = icmp ne i64 %88, 0
	br i1 %89, label %.L143, label %.L145
.L145:
	%90 = getelementptr i64, ptr %.TMP10, i64 0
	%91 = ptrtoint ptr %90 to i64
	; load constant 0 into %92
	%92 = add i64 0, 0
	%93 = inttoptr i64 %91 to ptr
	store i64 %92, ptr %93, align 8
	%94  = add i64 %92, 0; bloody hack
	br label %.L141
.L143:
	%95 = getelementptr i64, ptr %.TMP10, i64 0
	%96 = ptrtoint ptr %95 to i64
	; load constant 1 into %97
	%97 = add i64 1, 0
	%98 = inttoptr i64 %96 to ptr
	store i64 %97, ptr %98, align 8
	%99  = add i64 %97, 0; bloody hack
	br label %.L141
.L141:
	%100 = getelementptr i64, ptr %.TMP10, i64 0
	%101 = ptrtoint ptr %100 to i64
	%102 = inttoptr i64 %101 to ptr
	%103 = load i64, ptr %102, align 8
	%104 = sub i64 %103, 0
	%105 = icmp eq i64 %104, 0
	br i1 %105, label %.L140, label %.L146
.L146:
	%106 = call i64 @nextCh()
	store i64 %106, ptr %0, align 8
	br label %.L139
.L140:
	; load constant 3 into %107
	%107 = add i64 3, 0
	%108 = load i64, ptr @token, align 8
	%109 = inttoptr i64 %108 to ptr
	store i64 %107, ptr %109, align 8
	%110  = add i64 %107, 0; bloody hack
	store i64 %107, ptr %0, align 8
	br label %.L136
.L137:
	%111 = load i64, ptr @lexerCh, align 8
	; load constant '=' into %112
	%112 = add i64 61, 0
	%113 = icmp eq i64 %111, %112
	%114 = zext i1 %113 to i64
	%115 = sub i64 %114, 0
	%116 = icmp eq i64 %115, 0
	br i1 %116, label %.L148, label %.L149
.L149:
	%117 = call i64 @nextCh()
	store i64 %117, ptr %0, align 8
	%118 = load i64, ptr @lexerCh, align 8
	; load constant '=' into %119
	%119 = add i64 61, 0
	%120 = icmp eq i64 %118, %119
	%121 = zext i1 %120 to i64
	%122 = sub i64 %121, 0
	%123 = icmp eq i64 %122, 0
	br i1 %123, label %.L151, label %.L152
.L152:
	%124 = call i64 @nextCh()
	store i64 %124, ptr %0, align 8
	; load constant 28 into %125
	%125 = add i64 28, 0
	%126 = load i64, ptr @token, align 8
	%127 = inttoptr i64 %126 to ptr
	store i64 %125, ptr %127, align 8
	%128  = add i64 %125, 0; bloody hack
	store i64 %125, ptr %0, align 8
	br label %.L150
.L151:
	; load constant 4 into %129
	%129 = add i64 4, 0
	%130 = load i64, ptr @token, align 8
	%131 = inttoptr i64 %130 to ptr
	store i64 %129, ptr %131, align 8
	%132  = add i64 %129, 0; bloody hack
	store i64 %129, ptr %0, align 8
	br label %.L150
.L150:
	br label %.L147
.L148:
	%133 = load i64, ptr @lexerCh, align 8
	; load constant '<' into %134
	%134 = add i64 60, 0
	%135 = icmp eq i64 %133, %134
	%136 = zext i1 %135 to i64
	%137 = sub i64 %136, 0
	%138 = icmp eq i64 %137, 0
	br i1 %138, label %.L154, label %.L155
.L155:
	%139 = call i64 @nextCh()
	store i64 %139, ptr %0, align 8
	%140 = load i64, ptr @lexerCh, align 8
	; load constant '=' into %141
	%141 = add i64 61, 0
	%142 = icmp eq i64 %140, %141
	%143 = zext i1 %142 to i64
	%144 = sub i64 %143, 0
	%145 = icmp eq i64 %144, 0
	br i1 %145, label %.L157, label %.L158
.L158:
	%146 = call i64 @nextCh()
	store i64 %146, ptr %0, align 8
	; load constant 24 into %147
	%147 = add i64 24, 0
	%148 = load i64, ptr @token, align 8
	%149 = inttoptr i64 %148 to ptr
	store i64 %147, ptr %149, align 8
	%150  = add i64 %147, 0; bloody hack
	store i64 %147, ptr %0, align 8
	br label %.L156
.L157:
	; load constant 25 into %151
	%151 = add i64 25, 0
	%152 = load i64, ptr @token, align 8
	%153 = inttoptr i64 %152 to ptr
	store i64 %151, ptr %153, align 8
	%154  = add i64 %151, 0; bloody hack
	store i64 %151, ptr %0, align 8
	br label %.L156
.L156:
	br label %.L153
.L154:
	%155 = load i64, ptr @lexerCh, align 8
	; load constant '>' into %156
	%156 = add i64 62, 0
	%157 = icmp eq i64 %155, %156
	%158 = zext i1 %157 to i64
	%159 = sub i64 %158, 0
	%160 = icmp eq i64 %159, 0
	br i1 %160, label %.L160, label %.L161
.L161:
	%161 = call i64 @nextCh()
	store i64 %161, ptr %0, align 8
	%162 = load i64, ptr @lexerCh, align 8
	; load constant '=' into %163
	%163 = add i64 61, 0
	%164 = icmp eq i64 %162, %163
	%165 = zext i1 %164 to i64
	%166 = sub i64 %165, 0
	%167 = icmp eq i64 %166, 0
	br i1 %167, label %.L163, label %.L164
.L164:
	%168 = call i64 @nextCh()
	store i64 %168, ptr %0, align 8
	; load constant 27 into %169
	%169 = add i64 27, 0
	%170 = load i64, ptr @token, align 8
	%171 = inttoptr i64 %170 to ptr
	store i64 %169, ptr %171, align 8
	%172  = add i64 %169, 0; bloody hack
	store i64 %169, ptr %0, align 8
	br label %.L162
.L163:
	; load constant 26 into %173
	%173 = add i64 26, 0
	%174 = load i64, ptr @token, align 8
	%175 = inttoptr i64 %174 to ptr
	store i64 %173, ptr %175, align 8
	%176  = add i64 %173, 0; bloody hack
	store i64 %173, ptr %0, align 8
	br label %.L162
.L162:
	br label %.L159
.L160:
	%177 = load i64, ptr @lexerCh, align 8
	; load constant '!' into %178
	%178 = add i64 33, 0
	%179 = icmp eq i64 %177, %178
	%180 = zext i1 %179 to i64
	%181 = sub i64 %180, 0
	%182 = icmp eq i64 %181, 0
	br i1 %182, label %.L166, label %.L167
.L167:
	%183 = call i64 @nextCh()
	store i64 %183, ptr %0, align 8
	%184 = load i64, ptr @lexerCh, align 8
	; load constant '=' into %185
	%185 = add i64 61, 0
	%186 = icmp eq i64 %184, %185
	%187 = zext i1 %186 to i64
	%188 = sub i64 %187, 0
	%189 = icmp eq i64 %188, 0
	br i1 %189, label %.L169, label %.L170
.L170:
	%190 = call i64 @nextCh()
	store i64 %190, ptr %0, align 8
	; load constant 30 into %191
	%191 = add i64 30, 0
	%192 = load i64, ptr @token, align 8
	%193 = inttoptr i64 %192 to ptr
	store i64 %191, ptr %193, align 8
	%194  = add i64 %191, 0; bloody hack
	store i64 %191, ptr %0, align 8
	br label %.L168
.L169:
	; load constant 29 into %195
	%195 = add i64 29, 0
	%196 = load i64, ptr @token, align 8
	%197 = inttoptr i64 %196 to ptr
	store i64 %195, ptr %197, align 8
	%198  = add i64 %195, 0; bloody hack
	store i64 %195, ptr %0, align 8
	br label %.L168
.L168:
	br label %.L165
.L166:
	%199 = load i64, ptr @lexerCh, align 8
	; load constant '%' into %200
	%200 = add i64 37, 0
	%201 = icmp eq i64 %199, %200
	%202 = zext i1 %201 to i64
	%203 = sub i64 %202, 0
	%204 = icmp eq i64 %203, 0
	br i1 %204, label %.L172, label %.L173
.L173:
	%205 = call i64 @nextCh()
	store i64 %205, ptr %0, align 8
	; load constant 31 into %206
	%206 = add i64 31, 0
	%207 = load i64, ptr @token, align 8
	%208 = inttoptr i64 %207 to ptr
	store i64 %206, ptr %208, align 8
	%209  = add i64 %206, 0; bloody hack
	store i64 %206, ptr %0, align 8
	br label %.L171
.L172:
	%210 = load i64, ptr @lexerCh, align 8
	; load constant '#' into %211
	%211 = add i64 35, 0
	%212 = icmp eq i64 %210, %211
	%213 = zext i1 %212 to i64
	%214 = sub i64 %213, 0
	%215 = icmp eq i64 %214, 0
	br i1 %215, label %.L175, label %.L176
.L176:
	%216 = call i64 @nextCh()
	store i64 %216, ptr %0, align 8
	; load constant 32 into %217
	%217 = add i64 32, 0
	%218 = load i64, ptr @token, align 8
	%219 = inttoptr i64 %218 to ptr
	store i64 %217, ptr %219, align 8
	%220  = add i64 %217, 0; bloody hack
	store i64 %217, ptr %0, align 8
	br label %.L174
.L175:
	%221 = load i64, ptr @lexerCh, align 8
	; load constant '&' into %222
	%222 = add i64 38, 0
	%223 = icmp eq i64 %221, %222
	%224 = zext i1 %223 to i64
	%225 = sub i64 %224, 0
	%226 = icmp eq i64 %225, 0
	br i1 %226, label %.L178, label %.L179
.L179:
	%227 = call i64 @nextCh()
	store i64 %227, ptr %0, align 8
	%228 = load i64, ptr @lexerCh, align 8
	; load constant '&' into %229
	%229 = add i64 38, 0
	%230 = icmp eq i64 %228, %229
	%231 = zext i1 %230 to i64
	%232 = sub i64 %231, 0
	%233 = icmp eq i64 %232, 0
	br i1 %233, label %.L181, label %.L182
.L182:
	%234 = call i64 @nextCh()
	store i64 %234, ptr %0, align 8
	; load constant 34 into %235
	%235 = add i64 34, 0
	%236 = load i64, ptr @token, align 8
	%237 = inttoptr i64 %236 to ptr
	store i64 %235, ptr %237, align 8
	%238  = add i64 %235, 0; bloody hack
	store i64 %235, ptr %0, align 8
	br label %.L180
.L181:
	; load constant 33 into %239
	%239 = add i64 33, 0
	%240 = load i64, ptr @token, align 8
	%241 = inttoptr i64 %240 to ptr
	store i64 %239, ptr %241, align 8
	%242  = add i64 %239, 0; bloody hack
	store i64 %239, ptr %0, align 8
	br label %.L180
.L180:
	br label %.L177
.L178:
	%243 = load i64, ptr @lexerCh, align 8
	; load constant '|' into %244
	%244 = add i64 124, 0
	%245 = icmp eq i64 %243, %244
	%246 = zext i1 %245 to i64
	%247 = sub i64 %246, 0
	%248 = icmp eq i64 %247, 0
	br i1 %248, label %.L184, label %.L185
.L185:
	%249 = call i64 @nextCh()
	store i64 %249, ptr %0, align 8
	%250 = load i64, ptr @lexerCh, align 8
	; load constant '|' into %251
	%251 = add i64 124, 0
	%252 = icmp eq i64 %250, %251
	%253 = zext i1 %252 to i64
	%254 = sub i64 %253, 0
	%255 = icmp eq i64 %254, 0
	br i1 %255, label %.L187, label %.L188
.L188:
	%256 = call i64 @nextCh()
	store i64 %256, ptr %0, align 8
	; load constant 36 into %257
	%257 = add i64 36, 0
	%258 = load i64, ptr @token, align 8
	%259 = inttoptr i64 %258 to ptr
	store i64 %257, ptr %259, align 8
	%260  = add i64 %257, 0; bloody hack
	store i64 %257, ptr %0, align 8
	br label %.L186
.L187:
	; load constant 35 into %261
	%261 = add i64 35, 0
	%262 = load i64, ptr @token, align 8
	%263 = inttoptr i64 %262 to ptr
	store i64 %261, ptr %263, align 8
	%264  = add i64 %261, 0; bloody hack
	store i64 %261, ptr %0, align 8
	br label %.L186
.L186:
	br label %.L183
.L184:
	%265 = load i64, ptr @lexerCh, align 8
	; load constant ';' into %266
	%266 = add i64 59, 0
	%267 = icmp eq i64 %265, %266
	%268 = zext i1 %267 to i64
	%269 = sub i64 %268, 0
	%270 = icmp eq i64 %269, 0
	br i1 %270, label %.L190, label %.L191
.L191:
	%271 = call i64 @nextCh()
	store i64 %271, ptr %0, align 8
	; load constant 5 into %272
	%272 = add i64 5, 0
	%273 = load i64, ptr @token, align 8
	%274 = inttoptr i64 %273 to ptr
	store i64 %272, ptr %274, align 8
	%275  = add i64 %272, 0; bloody hack
	store i64 %272, ptr %0, align 8
	br label %.L189
.L190:
	%276 = load i64, ptr @lexerCh, align 8
	; load constant ',' into %277
	%277 = add i64 44, 0
	%278 = icmp eq i64 %276, %277
	%279 = zext i1 %278 to i64
	%280 = sub i64 %279, 0
	%281 = icmp eq i64 %280, 0
	br i1 %281, label %.L193, label %.L194
.L194:
	%282 = call i64 @nextCh()
	store i64 %282, ptr %0, align 8
	; load constant 6 into %283
	%283 = add i64 6, 0
	%284 = load i64, ptr @token, align 8
	%285 = inttoptr i64 %284 to ptr
	store i64 %283, ptr %285, align 8
	%286  = add i64 %283, 0; bloody hack
	store i64 %283, ptr %0, align 8
	br label %.L192
.L193:
	%287 = load i64, ptr @lexerCh, align 8
	; load constant '+' into %288
	%288 = add i64 43, 0
	%289 = icmp eq i64 %287, %288
	%290 = zext i1 %289 to i64
	%291 = sub i64 %290, 0
	%292 = icmp eq i64 %291, 0
	br i1 %292, label %.L196, label %.L197
.L197:
	%293 = call i64 @nextCh()
	store i64 %293, ptr %0, align 8
	; load constant 7 into %294
	%294 = add i64 7, 0
	%295 = load i64, ptr @token, align 8
	%296 = inttoptr i64 %295 to ptr
	store i64 %294, ptr %296, align 8
	%297  = add i64 %294, 0; bloody hack
	store i64 %294, ptr %0, align 8
	br label %.L195
.L196:
	%298 = load i64, ptr @lexerCh, align 8
	; load constant '-' into %299
	%299 = add i64 45, 0
	%300 = icmp eq i64 %298, %299
	%301 = zext i1 %300 to i64
	%302 = sub i64 %301, 0
	%303 = icmp eq i64 %302, 0
	br i1 %303, label %.L199, label %.L200
.L200:
	%304 = call i64 @nextCh()
	store i64 %304, ptr %0, align 8
	; load constant 8 into %305
	%305 = add i64 8, 0
	%306 = load i64, ptr @token, align 8
	%307 = inttoptr i64 %306 to ptr
	store i64 %305, ptr %307, align 8
	%308  = add i64 %305, 0; bloody hack
	store i64 %305, ptr %0, align 8
	br label %.L198
.L199:
	%309 = load i64, ptr @lexerCh, align 8
	; load constant '*' into %310
	%310 = add i64 42, 0
	%311 = icmp eq i64 %309, %310
	%312 = zext i1 %311 to i64
	%313 = sub i64 %312, 0
	%314 = icmp eq i64 %313, 0
	br i1 %314, label %.L202, label %.L203
.L203:
	%315 = call i64 @nextCh()
	store i64 %315, ptr %0, align 8
	; load constant 9 into %316
	%316 = add i64 9, 0
	%317 = load i64, ptr @token, align 8
	%318 = inttoptr i64 %317 to ptr
	store i64 %316, ptr %318, align 8
	%319  = add i64 %316, 0; bloody hack
	store i64 %316, ptr %0, align 8
	br label %.L201
.L202:
	%320 = load i64, ptr @lexerCh, align 8
	; load constant '/' into %321
	%321 = add i64 47, 0
	%322 = icmp eq i64 %320, %321
	%323 = zext i1 %322 to i64
	%324 = sub i64 %323, 0
	%325 = icmp eq i64 %324, 0
	br i1 %325, label %.L205, label %.L206
.L206:
	%326 = call i64 @nextCh()
	store i64 %326, ptr %0, align 8
	%327 = load i64, ptr @lexerCh, align 8
	; load constant '/' into %328
	%328 = add i64 47, 0
	%329 = icmp eq i64 %327, %328
	%330 = zext i1 %329 to i64
	%331 = sub i64 %330, 0
	%332 = icmp eq i64 %331, 0
	br i1 %332, label %.L208, label %.L209
.L209:
	br label %.L210
.L210:
	%333 = load i64, ptr @lexerCh, align 8
	; load constant '\n' into %334
	%334 = add i64 10, 0
	%335 = icmp ne i64 %333, %334
	%336 = zext i1 %335 to i64
	%337 = sub i64 %336, 0
	%338 = icmp eq i64 %337, 0
	br i1 %338, label %.L211, label %.L212
.L212:
	%339 = call i64 @nextCh()
	store i64 %339, ptr %0, align 8
	br label %.L210
.L211:
	%340 = call i64 @getToken()
	%341 = load i64, ptr @token, align 8
	%342 = inttoptr i64 %341 to ptr
	store i64 %340, ptr %342, align 8
	%343  = add i64 %340, 0; bloody hack
	store i64 %340, ptr %0, align 8
	br label %.L207
.L208:
	; load constant 10 into %344
	%344 = add i64 10, 0
	%345 = load i64, ptr @token, align 8
	%346 = inttoptr i64 %345 to ptr
	store i64 %344, ptr %346, align 8
	%347  = add i64 %344, 0; bloody hack
	store i64 %344, ptr %0, align 8
	br label %.L207
.L207:
	br label %.L204
.L205:
	%348 = load i64, ptr @lexerCh, align 8
	; load constant '(' into %349
	%349 = add i64 40, 0
	%350 = icmp eq i64 %348, %349
	%351 = zext i1 %350 to i64
	%352 = sub i64 %351, 0
	%353 = icmp eq i64 %352, 0
	br i1 %353, label %.L214, label %.L215
.L215:
	%354 = call i64 @nextCh()
	store i64 %354, ptr %0, align 8
	; load constant 12 into %355
	%355 = add i64 12, 0
	%356 = load i64, ptr @token, align 8
	%357 = inttoptr i64 %356 to ptr
	store i64 %355, ptr %357, align 8
	%358  = add i64 %355, 0; bloody hack
	store i64 %355, ptr %0, align 8
	br label %.L213
.L214:
	%359 = load i64, ptr @lexerCh, align 8
	; load constant ')' into %360
	%360 = add i64 41, 0
	%361 = icmp eq i64 %359, %360
	%362 = zext i1 %361 to i64
	%363 = sub i64 %362, 0
	%364 = icmp eq i64 %363, 0
	br i1 %364, label %.L217, label %.L218
.L218:
	%365 = call i64 @nextCh()
	store i64 %365, ptr %0, align 8
	; load constant 11 into %366
	%366 = add i64 11, 0
	%367 = load i64, ptr @token, align 8
	%368 = inttoptr i64 %367 to ptr
	store i64 %366, ptr %368, align 8
	%369  = add i64 %366, 0; bloody hack
	store i64 %366, ptr %0, align 8
	br label %.L216
.L217:
	%370 = load i64, ptr @lexerCh, align 8
	; load constant '{' into %371
	%371 = add i64 123, 0
	%372 = icmp eq i64 %370, %371
	%373 = zext i1 %372 to i64
	%374 = sub i64 %373, 0
	%375 = icmp eq i64 %374, 0
	br i1 %375, label %.L220, label %.L221
.L221:
	%376 = call i64 @nextCh()
	store i64 %376, ptr %0, align 8
	; load constant 13 into %377
	%377 = add i64 13, 0
	%378 = load i64, ptr @token, align 8
	%379 = inttoptr i64 %378 to ptr
	store i64 %377, ptr %379, align 8
	%380  = add i64 %377, 0; bloody hack
	store i64 %377, ptr %0, align 8
	br label %.L219
.L220:
	%381 = load i64, ptr @lexerCh, align 8
	; load constant '}' into %382
	%382 = add i64 125, 0
	%383 = icmp eq i64 %381, %382
	%384 = zext i1 %383 to i64
	%385 = sub i64 %384, 0
	%386 = icmp eq i64 %385, 0
	br i1 %386, label %.L223, label %.L224
.L224:
	%387 = call i64 @nextCh()
	store i64 %387, ptr %0, align 8
	; load constant 14 into %388
	%388 = add i64 14, 0
	%389 = load i64, ptr @token, align 8
	%390 = inttoptr i64 %389 to ptr
	store i64 %388, ptr %390, align 8
	%391  = add i64 %388, 0; bloody hack
	store i64 %388, ptr %0, align 8
	br label %.L222
.L223:
	%392 = load i64, ptr @lexerCh, align 8
	; load constant '"' into %393
	%393 = add i64 34, 0
	%394 = icmp eq i64 %392, %393
	%395 = zext i1 %394 to i64
	%396 = sub i64 %395, 0
	%397 = icmp eq i64 %396, 0
	br i1 %397, label %.L226, label %.L227
.L227:
	%398 = call i64 @nextCh()
	store i64 %398, ptr %0, align 8
	; load constant 15 into %399
	%399 = add i64 15, 0
	%400 = load i64, ptr @token, align 8
	%401 = inttoptr i64 %400 to ptr
	store i64 %399, ptr %401, align 8
	%402  = add i64 %399, 0; bloody hack
	store i64 %399, ptr %0, align 8
	br label %.L228
.L228:
	%403 = load i64, ptr @lexerCh, align 8
	; load constant '"' into %404
	%404 = add i64 34, 0
	%405 = icmp ne i64 %403, %404
	%406 = zext i1 %405 to i64
	%407 = sub i64 %406, 0
	%408 = icmp eq i64 %407, 0
	br i1 %408, label %.L229, label %.L230
.L230:
	%409 = call i64 @nextCh()
	store i64 %409, ptr %0, align 8
	%.TMP11 = alloca i64, align 8
	%410 = load i64, ptr @lexerCh, align 8
	; load constant '\n' into %411
	%411 = add i64 10, 0
	%412 = icmp eq i64 %410, %411
	%413 = zext i1 %412 to i64
	%414 = sub i64 %413, 0
	%415 = icmp eq i64 %414, 0
	br i1 %415, label %.L234, label %.L236
.L236:
	%416 = getelementptr i64, ptr %.TMP11, i64 0
	%417 = ptrtoint ptr %416 to i64
	; load constant 1 into %418
	%418 = add i64 1, 0
	%419 = inttoptr i64 %417 to ptr
	store i64 %418, ptr %419, align 8
	%420  = add i64 %418, 0; bloody hack
	br label %.L233
.L234:
	%421 = load i64, ptr @lexerCh, align 8
	; load constant 0 into %422
	%422 = add i64 0, 0
	; load constant 1 into %423
	%423 = add i64 1, 0
	%424 = sub i64 %422, %423
	%425 = icmp eq i64 %421, %424
	%426 = zext i1 %425 to i64
	%427 = sub i64 %426, 0
	%428 = icmp ne i64 %427, 0
	br i1 %428, label %.L235, label %.L237
.L237:
	%429 = getelementptr i64, ptr %.TMP11, i64 0
	%430 = ptrtoint ptr %429 to i64
	; load constant 0 into %431
	%431 = add i64 0, 0
	%432 = inttoptr i64 %430 to ptr
	store i64 %431, ptr %432, align 8
	%433  = add i64 %431, 0; bloody hack
	br label %.L233
.L235:
	%434 = getelementptr i64, ptr %.TMP11, i64 0
	%435 = ptrtoint ptr %434 to i64
	; load constant 1 into %436
	%436 = add i64 1, 0
	%437 = inttoptr i64 %435 to ptr
	store i64 %436, ptr %437, align 8
	%438  = add i64 %436, 0; bloody hack
	br label %.L233
.L233:
	%439 = getelementptr i64, ptr %.TMP11, i64 0
	%440 = ptrtoint ptr %439 to i64
	%441 = inttoptr i64 %440 to ptr
	%442 = load i64, ptr %441, align 8
	%443 = sub i64 %442, 0
	%444 = icmp eq i64 %443, 0
	br i1 %444, label %.L232, label %.L238
.L238:
	; load constant 0 into %445
	%445 = add i64 0, 0
	%446 = load i64, ptr @token, align 8
	%447 = inttoptr i64 %446 to ptr
	store i64 %445, ptr %447, align 8
	%448  = add i64 %445, 0; bloody hack
	store i64 %445, ptr %0, align 8
	br label %.L231
.L232:
	br label %.L231
.L231:
	br label %.L228
.L229:
	%449 = load i64, ptr @token, align 8
	%450 = inttoptr i64 %449 to ptr
	%451 = load i64, ptr %450, align 8
	%452 = sub i64 %451, 0
	%453 = icmp eq i64 %452, 0
	br i1 %453, label %.L240, label %.L241
.L241:
	%454 = call i64 @nextCh()
	store i64 %454, ptr %0, align 8
	br label %.L239
.L240:
	br label %.L239
.L239:
	br label %.L225
.L226:
	%455 = load i64, ptr @lexerCh, align 8
	; load constant '\'' into %456
	%456 = add i64 39, 0
	%457 = icmp eq i64 %455, %456
	%458 = zext i1 %457 to i64
	%459 = sub i64 %458, 0
	%460 = icmp eq i64 %459, 0
	br i1 %460, label %.L243, label %.L244
.L244:
	%escape = alloca i64, align 8
	; load constant 0 into %461
	%461 = add i64 0, 0
	%462 = getelementptr i64, ptr %escape, i64 0
	%463 = ptrtoint ptr %462 to i64
	%464 = inttoptr i64 %463 to ptr
	store i64 %461, ptr %464, align 8
	%465  = add i64 %461, 0; bloody hack
	store i64 %461, ptr %0, align 8
	%466 = call i64 @nextCh()
	store i64 %466, ptr %0, align 8
	; load constant 16 into %467
	%467 = add i64 16, 0
	%468 = load i64, ptr @token, align 8
	%469 = inttoptr i64 %468 to ptr
	store i64 %467, ptr %469, align 8
	%470  = add i64 %467, 0; bloody hack
	store i64 %467, ptr %0, align 8
	br label %.L245
.L245:
	%.TMP12 = alloca i64, align 8
	%471 = load i64, ptr %escape, align 8
	%472 = sub i64 %471, 0
	%473 = icmp eq i64 %472, 0
	br i1 %473, label %.L248, label %.L250
.L250:
	%474 = getelementptr i64, ptr %.TMP12, i64 0
	%475 = ptrtoint ptr %474 to i64
	; load constant 1 into %476
	%476 = add i64 1, 0
	%477 = inttoptr i64 %475 to ptr
	store i64 %476, ptr %477, align 8
	%478  = add i64 %476, 0; bloody hack
	br label %.L247
.L248:
	%479 = load i64, ptr @lexerCh, align 8
	; load constant '\'' into %480
	%480 = add i64 39, 0
	%481 = icmp ne i64 %479, %480
	%482 = zext i1 %481 to i64
	%483 = sub i64 %482, 0
	%484 = icmp ne i64 %483, 0
	br i1 %484, label %.L249, label %.L251
.L251:
	%485 = getelementptr i64, ptr %.TMP12, i64 0
	%486 = ptrtoint ptr %485 to i64
	; load constant 0 into %487
	%487 = add i64 0, 0
	%488 = inttoptr i64 %486 to ptr
	store i64 %487, ptr %488, align 8
	%489  = add i64 %487, 0; bloody hack
	br label %.L247
.L249:
	%490 = getelementptr i64, ptr %.TMP12, i64 0
	%491 = ptrtoint ptr %490 to i64
	; load constant 1 into %492
	%492 = add i64 1, 0
	%493 = inttoptr i64 %491 to ptr
	store i64 %492, ptr %493, align 8
	%494  = add i64 %492, 0; bloody hack
	br label %.L247
.L247:
	%495 = getelementptr i64, ptr %.TMP12, i64 0
	%496 = ptrtoint ptr %495 to i64
	%497 = inttoptr i64 %496 to ptr
	%498 = load i64, ptr %497, align 8
	%499 = sub i64 %498, 0
	%500 = icmp eq i64 %499, 0
	br i1 %500, label %.L246, label %.L252
.L252:
	%501 = load i64, ptr %escape, align 8
	%502 = sub i64 %501, 0
	%503 = icmp eq i64 %502, 0
	br i1 %503, label %.L254, label %.L255
.L255:
	; load constant 0 into %504
	%504 = add i64 0, 0
	%505 = getelementptr i64, ptr %escape, i64 0
	%506 = ptrtoint ptr %505 to i64
	%507 = inttoptr i64 %506 to ptr
	store i64 %504, ptr %507, align 8
	%508  = add i64 %504, 0; bloody hack
	store i64 %504, ptr %0, align 8
	br label %.L253
.L254:
	%.TMP13 = alloca i64, align 8
	%509 = load i64, ptr %escape, align 8
	; load constant 0 into %510
	%510 = add i64 0, 0
	%511 = icmp eq i64 %509, %510
	%512 = zext i1 %511 to i64
	%513 = sub i64 %512, 0
	%514 = icmp ne i64 %513, 0
	br i1 %514, label %.L259, label %.L261
.L261:
	%515 = getelementptr i64, ptr %.TMP13, i64 0
	%516 = ptrtoint ptr %515 to i64
	; load constant 0 into %517
	%517 = add i64 0, 0
	%518 = inttoptr i64 %516 to ptr
	store i64 %517, ptr %518, align 8
	%519  = add i64 %517, 0; bloody hack
	; jump to end
	br label %.L258
.L259:
	%520 = load i64, ptr @lexerCh, align 8
	; load constant '\\' into %521
	%521 = add i64 92, 0
	%522 = icmp eq i64 %520, %521
	%523 = zext i1 %522 to i64
	%524 = sub i64 %523, 0
	%525 = icmp ne i64 %524, 0
	br i1 %525, label %.L260, label %.L262
.L262:
	%526 = getelementptr i64, ptr %.TMP13, i64 0
	%527 = ptrtoint ptr %526 to i64
	; load constant 0 into %528
	%528 = add i64 0, 0
	%529 = inttoptr i64 %527 to ptr
	store i64 %528, ptr %529, align 8
	%530  = add i64 %528, 0; bloody hack
	; jump to end
	br label %.L258
.L260:
	%531 = getelementptr i64, ptr %.TMP13, i64 0
	%532 = ptrtoint ptr %531 to i64
	; load constant 1 into %533
	%533 = add i64 1, 0
	%534 = inttoptr i64 %532 to ptr
	store i64 %533, ptr %534, align 8
	%535  = add i64 %533, 0; bloody hack
	br label %.L258
.L258:
	%536 = getelementptr i64, ptr %.TMP13, i64 0
	%537 = ptrtoint ptr %536 to i64
	%538 = inttoptr i64 %537 to ptr
	%539 = load i64, ptr %538, align 8
	%540 = sub i64 %539, 0
	%541 = icmp eq i64 %540, 0
	br i1 %541, label %.L257, label %.L263
.L263:
	; load constant 1 into %542
	%542 = add i64 1, 0
	%543 = getelementptr i64, ptr %escape, i64 0
	%544 = ptrtoint ptr %543 to i64
	%545 = inttoptr i64 %544 to ptr
	store i64 %542, ptr %545, align 8
	%546  = add i64 %542, 0; bloody hack
	store i64 %542, ptr %0, align 8
	br label %.L256
.L257:
	br label %.L256
.L256:
	br label %.L253
.L253:
	%547 = call i64 @nextCh()
	store i64 %547, ptr %0, align 8
	%.TMP14 = alloca i64, align 8
	%548 = load i64, ptr @lexerCh, align 8
	; load constant '\n' into %549
	%549 = add i64 10, 0
	%550 = icmp eq i64 %548, %549
	%551 = zext i1 %550 to i64
	%552 = sub i64 %551, 0
	%553 = icmp eq i64 %552, 0
	br i1 %553, label %.L267, label %.L269
.L269:
	%554 = getelementptr i64, ptr %.TMP14, i64 0
	%555 = ptrtoint ptr %554 to i64
	; load constant 1 into %556
	%556 = add i64 1, 0
	%557 = inttoptr i64 %555 to ptr
	store i64 %556, ptr %557, align 8
	%558  = add i64 %556, 0; bloody hack
	br label %.L266
.L267:
	%559 = load i64, ptr @lexerCh, align 8
	; load constant 0 into %560
	%560 = add i64 0, 0
	; load constant 1 into %561
	%561 = add i64 1, 0
	%562 = sub i64 %560, %561
	%563 = icmp eq i64 %559, %562
	%564 = zext i1 %563 to i64
	%565 = sub i64 %564, 0
	%566 = icmp ne i64 %565, 0
	br i1 %566, label %.L268, label %.L270
.L270:
	%567 = getelementptr i64, ptr %.TMP14, i64 0
	%568 = ptrtoint ptr %567 to i64
	; load constant 0 into %569
	%569 = add i64 0, 0
	%570 = inttoptr i64 %568 to ptr
	store i64 %569, ptr %570, align 8
	%571  = add i64 %569, 0; bloody hack
	br label %.L266
.L268:
	%572 = getelementptr i64, ptr %.TMP14, i64 0
	%573 = ptrtoint ptr %572 to i64
	; load constant 1 into %574
	%574 = add i64 1, 0
	%575 = inttoptr i64 %573 to ptr
	store i64 %574, ptr %575, align 8
	%576  = add i64 %574, 0; bloody hack
	br label %.L266
.L266:
	%577 = getelementptr i64, ptr %.TMP14, i64 0
	%578 = ptrtoint ptr %577 to i64
	%579 = inttoptr i64 %578 to ptr
	%580 = load i64, ptr %579, align 8
	%581 = sub i64 %580, 0
	%582 = icmp eq i64 %581, 0
	br i1 %582, label %.L265, label %.L271
.L271:
	; load constant 0 into %583
	%583 = add i64 0, 0
	%584 = load i64, ptr @token, align 8
	%585 = inttoptr i64 %584 to ptr
	store i64 %583, ptr %585, align 8
	%586  = add i64 %583, 0; bloody hack
	store i64 %583, ptr %0, align 8
	br label %.L264
.L265:
	br label %.L264
.L264:
	br label %.L245
.L246:
	%587 = load i64, ptr @token, align 8
	%588 = inttoptr i64 %587 to ptr
	%589 = load i64, ptr %588, align 8
	%590 = sub i64 %589, 0
	%591 = icmp eq i64 %590, 0
	br i1 %591, label %.L273, label %.L274
.L274:
	%592 = call i64 @nextCh()
	store i64 %592, ptr %0, align 8
	br label %.L272
.L273:
	br label %.L272
.L272:
	br label %.L242
.L243:
	%593 = load i64, ptr @lexerCh, align 8
	; load constant 0 into %594
	%594 = add i64 0, 0
	; load constant 1 into %595
	%595 = add i64 1, 0
	%596 = sub i64 %594, %595
	%597 = icmp eq i64 %593, %596
	%598 = zext i1 %597 to i64
	%599 = sub i64 %598, 0
	%600 = icmp eq i64 %599, 0
	br i1 %600, label %.L276, label %.L277
.L277:
	; load constant 1 into %601
	%601 = add i64 1, 0
	%602 = load i64, ptr @token, align 8
	%603 = inttoptr i64 %602 to ptr
	store i64 %601, ptr %603, align 8
	%604  = add i64 %601, 0; bloody hack
	store i64 %601, ptr %0, align 8
	br label %.L275
.L276:
	%605 = call i64 @nextCh()
	store i64 %605, ptr %0, align 8
	; load constant 0 into %606
	%606 = add i64 0, 0
	%607 = load i64, ptr @token, align 8
	%608 = inttoptr i64 %607 to ptr
	store i64 %606, ptr %608, align 8
	%609  = add i64 %606, 0; bloody hack
	store i64 %606, ptr %0, align 8
	br label %.L275
.L275:
	br label %.L242
.L242:
	br label %.L225
.L225:
	br label %.L222
.L222:
	br label %.L219
.L219:
	br label %.L216
.L216:
	br label %.L213
.L213:
	br label %.L204
.L204:
	br label %.L201
.L201:
	br label %.L198
.L198:
	br label %.L195
.L195:
	br label %.L192
.L192:
	br label %.L189
.L189:
	br label %.L183
.L183:
	br label %.L177
.L177:
	br label %.L174
.L174:
	br label %.L171
.L171:
	br label %.L165
.L165:
	br label %.L159
.L159:
	br label %.L153
.L153:
	br label %.L147
.L147:
	br label %.L136
.L136:
	br label %.L130
.L130:
	%610 = load i64, ptr @lexerInternalVal, align 8
	%611 = call i64 @UStrCreate(i64 %610)
	%612 = load i64, ptr @token, align 8
	; load constant 8 into %613
	%613 = add i64 8, 0
	%614 = add i64 %612, %613
	%615 = inttoptr i64 %614 to ptr
	store i64 %611, ptr %615, align 8
	%616  = add i64 %611, 0; bloody hack
	store i64 %611, ptr %0, align 8
	%617 = load i64, ptr @token, align 8
	%618 = inttoptr i64 %617 to ptr
	%619 = load i64, ptr %618, align 8
	; load constant 3 into %620
	%620 = add i64 3, 0
	%621 = icmp eq i64 %619, %620
	%622 = zext i1 %621 to i64
	%623 = sub i64 %622, 0
	%624 = icmp eq i64 %623, 0
	br i1 %624, label %.L279, label %.L280
.L280:
	%625 = load i64, ptr @token, align 8
	; load constant 8 into %626
	%626 = add i64 8, 0
	%627 = add i64 %625, %626
	%628 = inttoptr i64 %627 to ptr
	%629 = load i64, ptr %628, align 8
	%630 = load i64, ptr @kw_if, align 8
	%631 = icmp eq i64 %629, %630
	%632 = zext i1 %631 to i64
	%633 = sub i64 %632, 0
	%634 = icmp eq i64 %633, 0
	br i1 %634, label %.L282, label %.L283
.L283:
	; load constant 17 into %635
	%635 = add i64 17, 0
	%636 = load i64, ptr @token, align 8
	%637 = inttoptr i64 %636 to ptr
	store i64 %635, ptr %637, align 8
	%638  = add i64 %635, 0; bloody hack
	store i64 %635, ptr %0, align 8
	br label %.L281
.L282:
	%639 = load i64, ptr @token, align 8
	; load constant 8 into %640
	%640 = add i64 8, 0
	%641 = add i64 %639, %640
	%642 = inttoptr i64 %641 to ptr
	%643 = load i64, ptr %642, align 8
	%644 = load i64, ptr @kw_while, align 8
	%645 = icmp eq i64 %643, %644
	%646 = zext i1 %645 to i64
	%647 = sub i64 %646, 0
	%648 = icmp eq i64 %647, 0
	br i1 %648, label %.L285, label %.L286
.L286:
	; load constant 18 into %649
	%649 = add i64 18, 0
	%650 = load i64, ptr @token, align 8
	%651 = inttoptr i64 %650 to ptr
	store i64 %649, ptr %651, align 8
	%652  = add i64 %649, 0; bloody hack
	store i64 %649, ptr %0, align 8
	br label %.L284
.L285:
	%653 = load i64, ptr @token, align 8
	; load constant 8 into %654
	%654 = add i64 8, 0
	%655 = add i64 %653, %654
	%656 = inttoptr i64 %655 to ptr
	%657 = load i64, ptr %656, align 8
	%658 = load i64, ptr @kw_global, align 8
	%659 = icmp eq i64 %657, %658
	%660 = zext i1 %659 to i64
	%661 = sub i64 %660, 0
	%662 = icmp eq i64 %661, 0
	br i1 %662, label %.L288, label %.L289
.L289:
	; load constant 19 into %663
	%663 = add i64 19, 0
	%664 = load i64, ptr @token, align 8
	%665 = inttoptr i64 %664 to ptr
	store i64 %663, ptr %665, align 8
	%666  = add i64 %663, 0; bloody hack
	store i64 %663, ptr %0, align 8
	br label %.L287
.L288:
	%667 = load i64, ptr @token, align 8
	; load constant 8 into %668
	%668 = add i64 8, 0
	%669 = add i64 %667, %668
	%670 = inttoptr i64 %669 to ptr
	%671 = load i64, ptr %670, align 8
	%672 = load i64, ptr @kw_local, align 8
	%673 = icmp eq i64 %671, %672
	%674 = zext i1 %673 to i64
	%675 = sub i64 %674, 0
	%676 = icmp eq i64 %675, 0
	br i1 %676, label %.L291, label %.L292
.L292:
	; load constant 20 into %677
	%677 = add i64 20, 0
	%678 = load i64, ptr @token, align 8
	%679 = inttoptr i64 %678 to ptr
	store i64 %677, ptr %679, align 8
	%680  = add i64 %677, 0; bloody hack
	store i64 %677, ptr %0, align 8
	br label %.L290
.L291:
	%681 = load i64, ptr @token, align 8
	; load constant 8 into %682
	%682 = add i64 8, 0
	%683 = add i64 %681, %682
	%684 = inttoptr i64 %683 to ptr
	%685 = load i64, ptr %684, align 8
	%686 = load i64, ptr @kw_else, align 8
	%687 = icmp eq i64 %685, %686
	%688 = zext i1 %687 to i64
	%689 = sub i64 %688, 0
	%690 = icmp eq i64 %689, 0
	br i1 %690, label %.L294, label %.L295
.L295:
	; load constant 21 into %691
	%691 = add i64 21, 0
	%692 = load i64, ptr @token, align 8
	%693 = inttoptr i64 %692 to ptr
	store i64 %691, ptr %693, align 8
	%694  = add i64 %691, 0; bloody hack
	store i64 %691, ptr %0, align 8
	br label %.L293
.L294:
	%695 = load i64, ptr @token, align 8
	; load constant 8 into %696
	%696 = add i64 8, 0
	%697 = add i64 %695, %696
	%698 = inttoptr i64 %697 to ptr
	%699 = load i64, ptr %698, align 8
	%700 = load i64, ptr @kw_do, align 8
	%701 = icmp eq i64 %699, %700
	%702 = zext i1 %701 to i64
	%703 = sub i64 %702, 0
	%704 = icmp eq i64 %703, 0
	br i1 %704, label %.L297, label %.L298
.L298:
	; load constant 22 into %705
	%705 = add i64 22, 0
	%706 = load i64, ptr @token, align 8
	%707 = inttoptr i64 %706 to ptr
	store i64 %705, ptr %707, align 8
	%708  = add i64 %705, 0; bloody hack
	store i64 %705, ptr %0, align 8
	br label %.L296
.L297:
	%709 = load i64, ptr @token, align 8
	; load constant 8 into %710
	%710 = add i64 8, 0
	%711 = add i64 %709, %710
	%712 = inttoptr i64 %711 to ptr
	%713 = load i64, ptr %712, align 8
	%714 = load i64, ptr @kw_fn, align 8
	%715 = icmp eq i64 %713, %714
	%716 = zext i1 %715 to i64
	%717 = sub i64 %716, 0
	%718 = icmp eq i64 %717, 0
	br i1 %718, label %.L300, label %.L301
.L301:
	; load constant 23 into %719
	%719 = add i64 23, 0
	%720 = load i64, ptr @token, align 8
	%721 = inttoptr i64 %720 to ptr
	store i64 %719, ptr %721, align 8
	%722  = add i64 %719, 0; bloody hack
	store i64 %719, ptr %0, align 8
	br label %.L299
.L300:
	br label %.L299
.L299:
	br label %.L296
.L296:
	br label %.L293
.L293:
	br label %.L290
.L290:
	br label %.L287
.L287:
	br label %.L284
.L284:
	br label %.L281
.L281:
	br label %.L278
.L279:
	br label %.L278
.L278:
	%723 = load i64, ptr @token, align 8
	%724 = inttoptr i64 %723 to ptr
	%725 = load i64, ptr %724, align 8
	store i64 %725, ptr %0, align 8
	br label %.L302
.L302:
	%726= load i64, ptr %0, align 8
	ret i64 %726
}

; function testLexer
define i64 @testLexer() {
.L303:
	%0 = alloca i64, align 8 ; ptr to ret val
	%1 = call i64 @initLexer()
	store i64 %1, ptr %0, align 8
	br label %.L304
.L304:
	%2 = call i64 @getToken()
	; load constant 1 into %3
	%3 = add i64 1, 0
	%4 = icmp ne i64 %2, %3
	%5 = zext i1 %4 to i64
	%6 = sub i64 %5, 0
	%7 = icmp eq i64 %6, 0
	br i1 %7, label %.L305, label %.L306
.L306:
	%8 = load i64, ptr @token, align 8
	; load constant 16 into %9
	%9 = add i64 16, 0
	%10 = add i64 %8, %9
	%11 = inttoptr i64 %10 to ptr
	%12 = load i64, ptr %11, align 8
	%13 = call i64 @printInt(i64 %12)
	store i64 %13, ptr %0, align 8
	%14 = getelementptr i64, ptr @.STR18, i64 0
	%15 = ptrtoint ptr %14 to i64
	%16 = call i64 @print(i64 %15)
	store i64 %16, ptr %0, align 8
	%17 = load i64, ptr @token, align 8
	; load constant 24 into %18
	%18 = add i64 24, 0
	%19 = add i64 %17, %18
	%20 = inttoptr i64 %19 to ptr
	%21 = load i64, ptr %20, align 8
	%22 = call i64 @printInt(i64 %21)
	store i64 %22, ptr %0, align 8
	%23 = getelementptr i64, ptr @.STR19, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = call i64 @print(i64 %24)
	store i64 %25, ptr %0, align 8
	%26 = load i64, ptr @token, align 8
	; load constant 0 into %27
	%27 = add i64 0, 0
	%28 = add i64 %26, %27
	%29 = inttoptr i64 %28 to ptr
	%30 = load i64, ptr %29, align 8
	%31 = call i64 @printInt(i64 %30)
	store i64 %31, ptr %0, align 8
	%32 = getelementptr i64, ptr @.STR20, i64 0
	%33 = ptrtoint ptr %32 to i64
	%34 = call i64 @print(i64 %33)
	store i64 %34, ptr %0, align 8
	%35 = load i64, ptr @token, align 8
	; load constant 8 into %36
	%36 = add i64 8, 0
	%37 = add i64 %35, %36
	%38 = inttoptr i64 %37 to ptr
	%39 = load i64, ptr %38, align 8
	%40 = call i64 @println(i64 %39)
	store i64 %40, ptr %0, align 8
	br label %.L304
.L305:
	br label %.L307
.L307:
	%41= load i64, ptr %0, align 8
	ret i64 %41
}

@.STR20 = global [3 x i8] c") \00", align 8
@.STR19 = global [4 x i8] c": (\00", align 8
@.STR18 = global [2 x i8] c".\00", align 8
; function symtab_isInList
define i64 @symtab_isInList(i64 %0, i64 %1) {
.L308:
	%list = alloca i64, align 8
	store i64 %0, ptr %list, align 8
	%ident = alloca i64, align 8
	store i64 %1, ptr %ident, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%found = alloca i64, align 8
	; load constant 0 into %3
	%3 = add i64 0, 0
	%4 = getelementptr i64, ptr %found, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %2, align 8
	br label %.L309
.L309:
	%.TMP15 = alloca i64, align 8
	%8 = load i64, ptr %list, align 8
	%9 = sub i64 %8, 0
	%10 = icmp ne i64 %9, 0
	br i1 %10, label %.L312, label %.L314
.L314:
	%11 = getelementptr i64, ptr %.TMP15, i64 0
	%12 = ptrtoint ptr %11 to i64
	; load constant 0 into %13
	%13 = add i64 0, 0
	%14 = inttoptr i64 %12 to ptr
	store i64 %13, ptr %14, align 8
	%15  = add i64 %13, 0; bloody hack
	; jump to end
	br label %.L311
.L312:
	%16 = load i64, ptr %found, align 8
	; load constant 0 into %17
	%17 = add i64 0, 0
	%18 = icmp eq i64 %16, %17
	%19 = zext i1 %18 to i64
	%20 = sub i64 %19, 0
	%21 = icmp ne i64 %20, 0
	br i1 %21, label %.L313, label %.L315
.L315:
	%22 = getelementptr i64, ptr %.TMP15, i64 0
	%23 = ptrtoint ptr %22 to i64
	; load constant 0 into %24
	%24 = add i64 0, 0
	%25 = inttoptr i64 %23 to ptr
	store i64 %24, ptr %25, align 8
	%26  = add i64 %24, 0; bloody hack
	; jump to end
	br label %.L311
.L313:
	%27 = getelementptr i64, ptr %.TMP15, i64 0
	%28 = ptrtoint ptr %27 to i64
	; load constant 1 into %29
	%29 = add i64 1, 0
	%30 = inttoptr i64 %28 to ptr
	store i64 %29, ptr %30, align 8
	%31  = add i64 %29, 0; bloody hack
	br label %.L311
.L311:
	%32 = getelementptr i64, ptr %.TMP15, i64 0
	%33 = ptrtoint ptr %32 to i64
	%34 = inttoptr i64 %33 to ptr
	%35 = load i64, ptr %34, align 8
	%36 = sub i64 %35, 0
	%37 = icmp eq i64 %36, 0
	br i1 %37, label %.L310, label %.L316
.L316:
	%38 = load i64, ptr %ident, align 8
	%39 = load i64, ptr %list, align 8
	; load constant 8 into %40
	%40 = add i64 8, 0
	%41 = add i64 %39, %40
	%42 = inttoptr i64 %41 to ptr
	%43 = load i64, ptr %42, align 8
	%44 = icmp eq i64 %38, %43
	%45 = zext i1 %44 to i64
	%46 = sub i64 %45, 0
	%47 = icmp eq i64 %46, 0
	br i1 %47, label %.L318, label %.L319
.L319:
	%48 = load i64, ptr %list, align 8
	%49 = getelementptr i64, ptr %found, i64 0
	%50 = ptrtoint ptr %49 to i64
	%51 = inttoptr i64 %50 to ptr
	store i64 %48, ptr %51, align 8
	%52  = add i64 %48, 0; bloody hack
	store i64 %48, ptr %2, align 8
	br label %.L317
.L318:
	br label %.L317
.L317:
	%53 = load i64, ptr %list, align 8
	%54 = inttoptr i64 %53 to ptr
	%55 = load i64, ptr %54, align 8
	%56 = getelementptr i64, ptr %list, i64 0
	%57 = ptrtoint ptr %56 to i64
	%58 = inttoptr i64 %57 to ptr
	store i64 %55, ptr %58, align 8
	%59  = add i64 %55, 0; bloody hack
	store i64 %55, ptr %2, align 8
	br label %.L309
.L310:
	%60 = load i64, ptr %found, align 8
	store i64 %60, ptr %2, align 8
	br label %.L320
.L320:
	%61= load i64, ptr %2, align 8
	ret i64 %61
}

; function symtabGetInfo
define i64 @symtabGetInfo(i64 %0, i64 %1) {
.L321:
	%ident = alloca i64, align 8
	store i64 %0, ptr %ident, align 8
	%infoPtr = alloca i64, align 8
	store i64 %1, ptr %infoPtr, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%found = alloca i64, align 8
	%3 = load i64, ptr %ident, align 8
	%4 = load i64, ptr @symtabLocalVar, align 8
	%5 = call i64 @symtab_isInList(i64 %4, i64 %3)
	%6 = getelementptr i64, ptr %found, i64 0
	%7 = ptrtoint ptr %6 to i64
	%8 = inttoptr i64 %7 to ptr
	store i64 %5, ptr %8, align 8
	%9  = add i64 %5, 0; bloody hack
	%10 = sub i64 %5, 0
	%11 = icmp eq i64 %10, 0
	br i1 %11, label %.L323, label %.L324
.L324:
	%12 = load i64, ptr %infoPtr, align 8
	%13 = sub i64 %12, 0
	%14 = icmp eq i64 %13, 0
	br i1 %14, label %.L326, label %.L327
.L327:
	; load constant 0 into %15
	%15 = add i64 0, 0
	%16 = load i64, ptr %infoPtr, align 8
	; load constant 0 into %17
	%17 = add i64 0, 0
	%18 = add i64 %16, %17
	%19 = inttoptr i64 %18 to ptr
	store i64 %15, ptr %19, align 8
	%20  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %2, align 8
	%21 = load i64, ptr %found, align 8
	; load constant 16 into %22
	%22 = add i64 16, 0
	%23 = add i64 %21, %22
	%24 = inttoptr i64 %23 to ptr
	%25 = load i64, ptr %24, align 8
	%26 = load i64, ptr %infoPtr, align 8
	; load constant 8 into %27
	%27 = add i64 8, 0
	%28 = add i64 %26, %27
	%29 = inttoptr i64 %28 to ptr
	store i64 %25, ptr %29, align 8
	%30  = add i64 %25, 0; bloody hack
	store i64 %25, ptr %2, align 8
	br label %.L325
.L326:
	br label %.L325
.L325:
	br label %.L322
.L323:
	%31 = load i64, ptr %ident, align 8
	%32 = load i64, ptr @symtabGlobalVar, align 8
	%33 = call i64 @symtab_isInList(i64 %32, i64 %31)
	%34 = getelementptr i64, ptr %found, i64 0
	%35 = ptrtoint ptr %34 to i64
	%36 = inttoptr i64 %35 to ptr
	store i64 %33, ptr %36, align 8
	%37  = add i64 %33, 0; bloody hack
	%38 = sub i64 %33, 0
	%39 = icmp eq i64 %38, 0
	br i1 %39, label %.L329, label %.L330
.L330:
	%40 = load i64, ptr %infoPtr, align 8
	%41 = sub i64 %40, 0
	%42 = icmp eq i64 %41, 0
	br i1 %42, label %.L332, label %.L333
.L333:
	; load constant 1 into %43
	%43 = add i64 1, 0
	%44 = load i64, ptr %infoPtr, align 8
	; load constant 0 into %45
	%45 = add i64 0, 0
	%46 = add i64 %44, %45
	%47 = inttoptr i64 %46 to ptr
	store i64 %43, ptr %47, align 8
	%48  = add i64 %43, 0; bloody hack
	store i64 %43, ptr %2, align 8
	br label %.L331
.L332:
	br label %.L331
.L331:
	br label %.L328
.L329:
	br label %.L328
.L328:
	br label %.L322
.L322:
	%49 = load i64, ptr %found, align 8
	; load constant 0 into %50
	%50 = add i64 0, 0
	%51 = icmp ne i64 %49, %50
	%52 = zext i1 %51 to i64
	store i64 %52, ptr %2, align 8
	br label %.L334
.L334:
	%53= load i64, ptr %2, align 8
	ret i64 %53
}

; function symtabIsDefined
define i64 @symtabIsDefined(i64 %0) {
.L335:
	%ident = alloca i64, align 8
	store i64 %0, ptr %ident, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	; load constant 0 into %2
	%2 = add i64 0, 0
	%3 = load i64, ptr %ident, align 8
	%4 = call i64 @symtabGetInfo(i64 %3, i64 %2)
	store i64 %4, ptr %1, align 8
	br label %.L336
.L336:
	%5= load i64, ptr %1, align 8
	ret i64 %5
}

; function symtabAddGlobal
define i64 @symtabAddGlobal(i64 %0) {
.L337:
	%ident = alloca i64, align 8
	store i64 %0, ptr %ident, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%added = alloca i64, align 8
	%n = alloca i64, align 8
	%2 = load i64, ptr %ident, align 8
	%3 = load i64, ptr @symtabGlobalVar, align 8
	%4 = call i64 @symtab_isInList(i64 %3, i64 %2)
	%5 = sub i64 %4, 0
	%6 = icmp eq i64 %5, 0
	br i1 %6, label %.L339, label %.L340
.L340:
	; load constant 0 into %7
	%7 = add i64 0, 0
	%8 = getelementptr i64, ptr %added, i64 0
	%9 = ptrtoint ptr %8 to i64
	%10 = inttoptr i64 %9 to ptr
	store i64 %7, ptr %10, align 8
	%11  = add i64 %7, 0; bloody hack
	store i64 %7, ptr %1, align 8
	br label %.L338
.L339:
	; load constant 16 into %12
	%12 = add i64 16, 0
	%13 = call i64 @malloc(i64 %12)
	%14 = getelementptr i64, ptr %n, i64 0
	%15 = ptrtoint ptr %14 to i64
	%16 = inttoptr i64 %15 to ptr
	store i64 %13, ptr %16, align 8
	%17  = add i64 %13, 0; bloody hack
	store i64 %13, ptr %1, align 8
	%18 = load i64, ptr %n, align 8
	; load constant 0 into %19
	%19 = add i64 0, 0
	%20 = icmp eq i64 %18, %19
	%21 = zext i1 %20 to i64
	%22 = sub i64 %21, 0
	%23 = icmp eq i64 %22, 0
	br i1 %23, label %.L342, label %.L343
.L343:
	%24 = getelementptr i64, ptr @.STR21, i64 0
	%25 = ptrtoint ptr %24 to i64
	%26 = call i64 @println(i64 %25)
	store i64 %26, ptr %1, align 8
	; load constant 0 into %27
	%27 = add i64 0, 0
	%28 = getelementptr i64, ptr %added, i64 0
	%29 = ptrtoint ptr %28 to i64
	%30 = inttoptr i64 %29 to ptr
	store i64 %27, ptr %30, align 8
	%31  = add i64 %27, 0; bloody hack
	store i64 %27, ptr %1, align 8
	br label %.L341
.L342:
	%32 = load i64, ptr @symtabGlobalVar, align 8
	%33 = load i64, ptr %n, align 8
	; load constant 0 into %34
	%34 = add i64 0, 0
	%35 = add i64 %33, %34
	%36 = inttoptr i64 %35 to ptr
	store i64 %32, ptr %36, align 8
	%37  = add i64 %32, 0; bloody hack
	store i64 %32, ptr %1, align 8
	%38 = load i64, ptr %ident, align 8
	%39 = load i64, ptr %n, align 8
	; load constant 8 into %40
	%40 = add i64 8, 0
	%41 = add i64 %39, %40
	%42 = inttoptr i64 %41 to ptr
	store i64 %38, ptr %42, align 8
	%43  = add i64 %38, 0; bloody hack
	store i64 %38, ptr %1, align 8
	%44 = load i64, ptr %n, align 8
	%45 = getelementptr i64, ptr @symtabGlobalVar, i64 0
	%46 = ptrtoint ptr %45 to i64
	%47 = inttoptr i64 %46 to ptr
	store i64 %44, ptr %47, align 8
	%48  = add i64 %44, 0; bloody hack
	store i64 %44, ptr %1, align 8
	; load constant 1 into %49
	%49 = add i64 1, 0
	%50 = getelementptr i64, ptr %added, i64 0
	%51 = ptrtoint ptr %50 to i64
	%52 = inttoptr i64 %51 to ptr
	store i64 %49, ptr %52, align 8
	%53  = add i64 %49, 0; bloody hack
	store i64 %49, ptr %1, align 8
	br label %.L341
.L341:
	br label %.L338
.L338:
	%54 = load i64, ptr %added, align 8
	store i64 %54, ptr %1, align 8
	br label %.L344
.L344:
	%55= load i64, ptr %1, align 8
	ret i64 %55
}

@.STR21 = global [14 x i8] c"out of memory\00", align 8
; function symtabAddLocal
define i64 @symtabAddLocal(i64 %0, i64 %1) {
.L345:
	%ident = alloca i64, align 8
	store i64 %0, ptr %ident, align 8
	%offset = alloca i64, align 8
	store i64 %1, ptr %offset, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%added = alloca i64, align 8
	%n = alloca i64, align 8
	%3 = load i64, ptr %ident, align 8
	%4 = load i64, ptr @symtabLocalVar, align 8
	%5 = call i64 @symtab_isInList(i64 %4, i64 %3)
	%6 = sub i64 %5, 0
	%7 = icmp eq i64 %6, 0
	br i1 %7, label %.L347, label %.L348
.L348:
	; load constant 0 into %8
	%8 = add i64 0, 0
	%9 = getelementptr i64, ptr %added, i64 0
	%10 = ptrtoint ptr %9 to i64
	%11 = inttoptr i64 %10 to ptr
	store i64 %8, ptr %11, align 8
	%12  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %2, align 8
	br label %.L346
.L347:
	; load constant 24 into %13
	%13 = add i64 24, 0
	%14 = call i64 @malloc(i64 %13)
	%15 = getelementptr i64, ptr %n, i64 0
	%16 = ptrtoint ptr %15 to i64
	%17 = inttoptr i64 %16 to ptr
	store i64 %14, ptr %17, align 8
	%18  = add i64 %14, 0; bloody hack
	store i64 %14, ptr %2, align 8
	%19 = load i64, ptr %n, align 8
	; load constant 0 into %20
	%20 = add i64 0, 0
	%21 = icmp eq i64 %19, %20
	%22 = zext i1 %21 to i64
	%23 = sub i64 %22, 0
	%24 = icmp eq i64 %23, 0
	br i1 %24, label %.L350, label %.L351
.L351:
	%25 = getelementptr i64, ptr @.STR22, i64 0
	%26 = ptrtoint ptr %25 to i64
	%27 = call i64 @println(i64 %26)
	store i64 %27, ptr %2, align 8
	; load constant 0 into %28
	%28 = add i64 0, 0
	%29 = getelementptr i64, ptr %added, i64 0
	%30 = ptrtoint ptr %29 to i64
	%31 = inttoptr i64 %30 to ptr
	store i64 %28, ptr %31, align 8
	%32  = add i64 %28, 0; bloody hack
	store i64 %28, ptr %2, align 8
	br label %.L349
.L350:
	%33 = load i64, ptr @symtabLocalVar, align 8
	%34 = load i64, ptr %n, align 8
	; load constant 0 into %35
	%35 = add i64 0, 0
	%36 = add i64 %34, %35
	%37 = inttoptr i64 %36 to ptr
	store i64 %33, ptr %37, align 8
	%38  = add i64 %33, 0; bloody hack
	store i64 %33, ptr %2, align 8
	%39 = load i64, ptr %ident, align 8
	%40 = load i64, ptr %n, align 8
	; load constant 8 into %41
	%41 = add i64 8, 0
	%42 = add i64 %40, %41
	%43 = inttoptr i64 %42 to ptr
	store i64 %39, ptr %43, align 8
	%44  = add i64 %39, 0; bloody hack
	store i64 %39, ptr %2, align 8
	%45 = load i64, ptr %offset, align 8
	%46 = load i64, ptr %n, align 8
	; load constant 16 into %47
	%47 = add i64 16, 0
	%48 = add i64 %46, %47
	%49 = inttoptr i64 %48 to ptr
	store i64 %45, ptr %49, align 8
	%50  = add i64 %45, 0; bloody hack
	store i64 %45, ptr %2, align 8
	%51 = load i64, ptr %n, align 8
	%52 = getelementptr i64, ptr @symtabLocalVar, i64 0
	%53 = ptrtoint ptr %52 to i64
	%54 = inttoptr i64 %53 to ptr
	store i64 %51, ptr %54, align 8
	%55  = add i64 %51, 0; bloody hack
	store i64 %51, ptr %2, align 8
	; load constant 1 into %56
	%56 = add i64 1, 0
	%57 = getelementptr i64, ptr %added, i64 0
	%58 = ptrtoint ptr %57 to i64
	%59 = inttoptr i64 %58 to ptr
	store i64 %56, ptr %59, align 8
	%60  = add i64 %56, 0; bloody hack
	store i64 %56, ptr %2, align 8
	br label %.L349
.L349:
	br label %.L346
.L346:
	%61 = load i64, ptr %added, align 8
	store i64 %61, ptr %2, align 8
	br label %.L352
.L352:
	%62= load i64, ptr %2, align 8
	ret i64 %62
}

@.STR22 = global [14 x i8] c"out of memory\00", align 8
; function symtabFreeLocals
define i64 @symtabFreeLocals() {
.L353:
	%0 = alloca i64, align 8 ; ptr to ret val
	%next = alloca i64, align 8
	br label %.L354
.L354:
	%1 = load i64, ptr @symtabLocalVar, align 8
	%2 = sub i64 %1, 0
	%3 = icmp eq i64 %2, 0
	br i1 %3, label %.L355, label %.L356
.L356:
	%4 = load i64, ptr @symtabLocalVar, align 8
	; load constant 0 into %5
	%5 = add i64 0, 0
	%6 = add i64 %4, %5
	%7 = inttoptr i64 %6 to ptr
	%8 = load i64, ptr %7, align 8
	%9 = getelementptr i64, ptr %next, i64 0
	%10 = ptrtoint ptr %9 to i64
	%11 = inttoptr i64 %10 to ptr
	store i64 %8, ptr %11, align 8
	%12  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %0, align 8
	%13 = load i64, ptr @symtabLocalVar, align 8
	%14 = call i64 @free(i64 %13)
	store i64 %14, ptr %0, align 8
	%15 = load i64, ptr %next, align 8
	%16 = getelementptr i64, ptr @symtabLocalVar, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = inttoptr i64 %17 to ptr
	store i64 %15, ptr %18, align 8
	%19  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %0, align 8
	br label %.L354
.L355:
	br label %.L357
.L357:
	%20= load i64, ptr %0, align 8
	ret i64 %20
}

; function symtabPrintGlobals
define i64 @symtabPrintGlobals() {
.L358:
	%0 = alloca i64, align 8 ; ptr to ret val
	%n = alloca i64, align 8
	%1 = load i64, ptr @symtabGlobalVar, align 8
	%2 = getelementptr i64, ptr %n, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = inttoptr i64 %3 to ptr
	store i64 %1, ptr %4, align 8
	%5  = add i64 %1, 0; bloody hack
	store i64 %1, ptr %0, align 8
	br label %.L359
.L359:
	%6 = load i64, ptr %n, align 8
	%7 = sub i64 %6, 0
	%8 = icmp eq i64 %7, 0
	br i1 %8, label %.L360, label %.L361
.L361:
	%9 = load i64, ptr %n, align 8
	; load constant 8 into %10
	%10 = add i64 8, 0
	%11 = add i64 %9, %10
	%12 = inttoptr i64 %11 to ptr
	%13 = load i64, ptr %12, align 8
	%14 = call i64 @genDefGlobal(i64 %13)
	store i64 %14, ptr %0, align 8
	%15 = load i64, ptr %n, align 8
	%16 = inttoptr i64 %15 to ptr
	%17 = load i64, ptr %16, align 8
	%18 = getelementptr i64, ptr %n, i64 0
	%19 = ptrtoint ptr %18 to i64
	%20 = inttoptr i64 %19 to ptr
	store i64 %17, ptr %20, align 8
	%21  = add i64 %17, 0; bloody hack
	store i64 %17, ptr %0, align 8
	br label %.L359
.L360:
	br label %.L362
.L362:
	%22= load i64, ptr %0, align 8
	ret i64 %22
}

; function symtabPrintLocals
define i64 @symtabPrintLocals() {
.L363:
	%0 = alloca i64, align 8 ; ptr to ret val
	%n = alloca i64, align 8
	%1 = load i64, ptr @symtabLocalVar, align 8
	%2 = getelementptr i64, ptr %n, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = inttoptr i64 %3 to ptr
	store i64 %1, ptr %4, align 8
	%5  = add i64 %1, 0; bloody hack
	store i64 %1, ptr %0, align 8
	br label %.L364
.L364:
	%6 = load i64, ptr %n, align 8
	%7 = sub i64 %6, 0
	%8 = icmp eq i64 %7, 0
	br i1 %8, label %.L365, label %.L366
.L366:
	%9 = load i64, ptr %n, align 8
	; load constant 8 into %10
	%10 = add i64 8, 0
	%11 = add i64 %9, %10
	%12 = inttoptr i64 %11 to ptr
	%13 = load i64, ptr %12, align 8
	%14 = call i64 @print(i64 %13)
	store i64 %14, ptr %0, align 8
	%15 = getelementptr i64, ptr @.STR23, i64 0
	%16 = ptrtoint ptr %15 to i64
	%17 = call i64 @print(i64 %16)
	store i64 %17, ptr %0, align 8
	%18 = load i64, ptr %n, align 8
	; load constant 16 into %19
	%19 = add i64 16, 0
	%20 = add i64 %18, %19
	%21 = inttoptr i64 %20 to ptr
	%22 = load i64, ptr %21, align 8
	%23 = call i64 @printInt(i64 %22)
	store i64 %23, ptr %0, align 8
	; load constant 0 into %24
	%24 = add i64 0, 0
	%25 = call i64 @println(i64 %24)
	store i64 %25, ptr %0, align 8
	%26 = load i64, ptr %n, align 8
	%27 = inttoptr i64 %26 to ptr
	%28 = load i64, ptr %27, align 8
	%29 = getelementptr i64, ptr %n, i64 0
	%30 = ptrtoint ptr %29 to i64
	%31 = inttoptr i64 %30 to ptr
	store i64 %28, ptr %31, align 8
	%32  = add i64 %28, 0; bloody hack
	store i64 %28, ptr %0, align 8
	br label %.L364
.L365:
	br label %.L367
.L367:
	%33= load i64, ptr %0, align 8
	ret i64 %33
}

@.STR23 = global [13 x i8] c" has offset \00", align 8
; function checkInfo
define i64 @checkInfo(i64 %0) {
.L368:
	%ident = alloca i64, align 8
	store i64 %0, ptr %ident, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%infoPtr = alloca i64, align 8
	%2 = getelementptr i64, ptr @.STR24, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = getelementptr i64, ptr %infoPtr, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %1, align 8
	%8 = load i64, ptr %ident, align 8
	%9 = call i64 @symtabIsDefined(i64 %8)
	%10 = sub i64 %9, 0
	%11 = icmp eq i64 %10, 0
	br i1 %11, label %.L370, label %.L371
.L371:
	%12 = load i64, ptr %ident, align 8
	%13 = call i64 @print(i64 %12)
	store i64 %13, ptr %1, align 8
	%14 = getelementptr i64, ptr @.STR25, i64 0
	%15 = ptrtoint ptr %14 to i64
	%16 = call i64 @println(i64 %15)
	store i64 %16, ptr %1, align 8
	br label %.L369
.L370:
	%17 = load i64, ptr %ident, align 8
	%18 = call i64 @print(i64 %17)
	store i64 %18, ptr %1, align 8
	%19 = getelementptr i64, ptr @.STR26, i64 0
	%20 = ptrtoint ptr %19 to i64
	%21 = call i64 @println(i64 %20)
	store i64 %21, ptr %1, align 8
	br label %.L369
.L369:
	%22 = load i64, ptr %infoPtr, align 8
	%23 = load i64, ptr %ident, align 8
	%24 = call i64 @symtabGetInfo(i64 %23, i64 %22)
	%25 = sub i64 %24, 0
	%26 = icmp eq i64 %25, 0
	br i1 %26, label %.L373, label %.L374
.L374:
	%27 = load i64, ptr %infoPtr, align 8
	; load constant 0 into %28
	%28 = add i64 0, 0
	%29 = add i64 %27, %28
	%30 = inttoptr i64 %29 to ptr
	%31 = load i64, ptr %30, align 8
	%32 = sub i64 %31, 0
	%33 = icmp eq i64 %32, 0
	br i1 %33, label %.L376, label %.L377
.L377:
	%34 = load i64, ptr %ident, align 8
	%35 = call i64 @print(i64 %34)
	store i64 %35, ptr %1, align 8
	%36 = getelementptr i64, ptr @.STR27, i64 0
	%37 = ptrtoint ptr %36 to i64
	%38 = call i64 @println(i64 %37)
	store i64 %38, ptr %1, align 8
	br label %.L375
.L376:
	%39 = load i64, ptr %ident, align 8
	%40 = call i64 @print(i64 %39)
	store i64 %40, ptr %1, align 8
	%41 = getelementptr i64, ptr @.STR28, i64 0
	%42 = ptrtoint ptr %41 to i64
	%43 = call i64 @print(i64 %42)
	store i64 %43, ptr %1, align 8
	%44 = load i64, ptr %infoPtr, align 8
	; load constant 8 into %45
	%45 = add i64 8, 0
	%46 = add i64 %44, %45
	%47 = inttoptr i64 %46 to ptr
	%48 = load i64, ptr %47, align 8
	%49 = call i64 @printInt(i64 %48)
	store i64 %49, ptr %1, align 8
	; load constant 0 into %50
	%50 = add i64 0, 0
	%51 = call i64 @println(i64 %50)
	store i64 %51, ptr %1, align 8
	br label %.L375
.L375:
	br label %.L372
.L373:
	%52 = getelementptr i64, ptr @.STR29, i64 0
	%53 = ptrtoint ptr %52 to i64
	%54 = call i64 @print(i64 %53)
	store i64 %54, ptr %1, align 8
	%55 = load i64, ptr %ident, align 8
	%56 = call i64 @println(i64 %55)
	store i64 %56, ptr %1, align 8
	br label %.L372
.L372:
	br label %.L378
.L378:
	%57= load i64, ptr %1, align 8
	ret i64 %57
}

@.STR29 = global [20 x i8] c"unknown identifier \00", align 8
@.STR28 = global [23 x i8] c" is local with offset \00", align 8
@.STR27 = global [11 x i8] c" is global\00", align 8
@.STR26 = global [16 x i8] c" is not defined\00", align 8
@.STR25 = global [12 x i8] c" is defined\00", align 8
@.STR24 = global [16 x i8] c"16 bytes ......\00", align 8
; function testSymtab
define i64 @testSymtab() {
.L379:
	%0 = alloca i64, align 8 ; ptr to ret val
	%.TMP16 = alloca i64, align 8
	%1 = getelementptr i64, ptr @.STR30, i64 0
	%2 = ptrtoint ptr %1 to i64
	%3 = call i64 @UStrCreate(i64 %2)
	%4 = call i64 @symtabAddGlobal(i64 %3)
	%5 = sub i64 %4, 0
	%6 = icmp eq i64 %5, 0
	br i1 %6, label %.L381, label %.L383
.L383:
	%7 = getelementptr i64, ptr %.TMP16, i64 0
	%8 = ptrtoint ptr %7 to i64
	; load constant 1 into %9
	%9 = add i64 1, 0
	%10 = inttoptr i64 %8 to ptr
	store i64 %9, ptr %10, align 8
	%11  = add i64 %9, 0; bloody hack
	br label %.L380
.L381:
	%12 = getelementptr i64, ptr @.STR31, i64 0
	%13 = ptrtoint ptr %12 to i64
	%14 = call i64 @print(i64 %13)
	%15 = sub i64 %14, 0
	%16 = icmp ne i64 %15, 0
	br i1 %16, label %.L382, label %.L384
.L384:
	%17 = getelementptr i64, ptr %.TMP16, i64 0
	%18 = ptrtoint ptr %17 to i64
	; load constant 0 into %19
	%19 = add i64 0, 0
	%20 = inttoptr i64 %18 to ptr
	store i64 %19, ptr %20, align 8
	%21  = add i64 %19, 0; bloody hack
	br label %.L380
.L382:
	%22 = getelementptr i64, ptr %.TMP16, i64 0
	%23 = ptrtoint ptr %22 to i64
	; load constant 1 into %24
	%24 = add i64 1, 0
	%25 = inttoptr i64 %23 to ptr
	store i64 %24, ptr %25, align 8
	%26  = add i64 %24, 0; bloody hack
	br label %.L380
.L380:
	%27 = getelementptr i64, ptr %.TMP16, i64 0
	%28 = ptrtoint ptr %27 to i64
	%29 = inttoptr i64 %28 to ptr
	%30 = load i64, ptr %29, align 8
	store i64 %30, ptr %0, align 8
	%31 = getelementptr i64, ptr @.STR32, i64 0
	%32 = ptrtoint ptr %31 to i64
	%33 = call i64 @UStrCreate(i64 %32)
	%34 = call i64 @checkInfo(i64 %33)
	store i64 %34, ptr %0, align 8
	%.TMP17 = alloca i64, align 8
	%35 = getelementptr i64, ptr @.STR33, i64 0
	%36 = ptrtoint ptr %35 to i64
	%37 = call i64 @UStrCreate(i64 %36)
	%38 = call i64 @symtabAddGlobal(i64 %37)
	%39 = sub i64 %38, 0
	%40 = icmp eq i64 %39, 0
	br i1 %40, label %.L386, label %.L388
.L388:
	%41 = getelementptr i64, ptr %.TMP17, i64 0
	%42 = ptrtoint ptr %41 to i64
	; load constant 1 into %43
	%43 = add i64 1, 0
	%44 = inttoptr i64 %42 to ptr
	store i64 %43, ptr %44, align 8
	%45  = add i64 %43, 0; bloody hack
	br label %.L385
.L386:
	%46 = getelementptr i64, ptr @.STR34, i64 0
	%47 = ptrtoint ptr %46 to i64
	%48 = call i64 @print(i64 %47)
	%49 = sub i64 %48, 0
	%50 = icmp ne i64 %49, 0
	br i1 %50, label %.L387, label %.L389
.L389:
	%51 = getelementptr i64, ptr %.TMP17, i64 0
	%52 = ptrtoint ptr %51 to i64
	; load constant 0 into %53
	%53 = add i64 0, 0
	%54 = inttoptr i64 %52 to ptr
	store i64 %53, ptr %54, align 8
	%55  = add i64 %53, 0; bloody hack
	br label %.L385
.L387:
	%56 = getelementptr i64, ptr %.TMP17, i64 0
	%57 = ptrtoint ptr %56 to i64
	; load constant 1 into %58
	%58 = add i64 1, 0
	%59 = inttoptr i64 %57 to ptr
	store i64 %58, ptr %59, align 8
	%60  = add i64 %58, 0; bloody hack
	br label %.L385
.L385:
	%61 = getelementptr i64, ptr %.TMP17, i64 0
	%62 = ptrtoint ptr %61 to i64
	%63 = inttoptr i64 %62 to ptr
	%64 = load i64, ptr %63, align 8
	store i64 %64, ptr %0, align 8
	%.TMP18 = alloca i64, align 8
	; load constant 0 into %65
	%65 = add i64 0, 0
	; load constant 8 into %66
	%66 = add i64 8, 0
	%67 = sub i64 %65, %66
	%68 = getelementptr i64, ptr @.STR35, i64 0
	%69 = ptrtoint ptr %68 to i64
	%70 = call i64 @UStrCreate(i64 %69)
	%71 = call i64 @symtabAddLocal(i64 %70, i64 %67)
	%72 = sub i64 %71, 0
	%73 = icmp eq i64 %72, 0
	br i1 %73, label %.L391, label %.L393
.L393:
	%74 = getelementptr i64, ptr %.TMP18, i64 0
	%75 = ptrtoint ptr %74 to i64
	; load constant 1 into %76
	%76 = add i64 1, 0
	%77 = inttoptr i64 %75 to ptr
	store i64 %76, ptr %77, align 8
	%78  = add i64 %76, 0; bloody hack
	br label %.L390
.L391:
	%79 = getelementptr i64, ptr @.STR36, i64 0
	%80 = ptrtoint ptr %79 to i64
	%81 = call i64 @print(i64 %80)
	%82 = sub i64 %81, 0
	%83 = icmp ne i64 %82, 0
	br i1 %83, label %.L392, label %.L394
.L394:
	%84 = getelementptr i64, ptr %.TMP18, i64 0
	%85 = ptrtoint ptr %84 to i64
	; load constant 0 into %86
	%86 = add i64 0, 0
	%87 = inttoptr i64 %85 to ptr
	store i64 %86, ptr %87, align 8
	%88  = add i64 %86, 0; bloody hack
	br label %.L390
.L392:
	%89 = getelementptr i64, ptr %.TMP18, i64 0
	%90 = ptrtoint ptr %89 to i64
	; load constant 1 into %91
	%91 = add i64 1, 0
	%92 = inttoptr i64 %90 to ptr
	store i64 %91, ptr %92, align 8
	%93  = add i64 %91, 0; bloody hack
	br label %.L390
.L390:
	%94 = getelementptr i64, ptr %.TMP18, i64 0
	%95 = ptrtoint ptr %94 to i64
	%96 = inttoptr i64 %95 to ptr
	%97 = load i64, ptr %96, align 8
	store i64 %97, ptr %0, align 8
	%98 = getelementptr i64, ptr @.STR37, i64 0
	%99 = ptrtoint ptr %98 to i64
	%100 = call i64 @UStrCreate(i64 %99)
	%101 = call i64 @checkInfo(i64 %100)
	store i64 %101, ptr %0, align 8
	%102 = getelementptr i64, ptr @.STR38, i64 0
	%103 = ptrtoint ptr %102 to i64
	%104 = call i64 @UStrCreate(i64 %103)
	%105 = call i64 @checkInfo(i64 %104)
	store i64 %105, ptr %0, align 8
	%106 = getelementptr i64, ptr @.STR39, i64 0
	%107 = ptrtoint ptr %106 to i64
	%108 = call i64 @UStrCreate(i64 %107)
	%109 = call i64 @checkInfo(i64 %108)
	store i64 %109, ptr %0, align 8
	br label %.L395
.L395:
	%110= load i64, ptr %0, align 8
	ret i64 %110
}

@.STR39 = global [5 x i8] c"barx\00", align 8
@.STR38 = global [4 x i8] c"bar\00", align 8
@.STR37 = global [4 x i8] c"foo\00", align 8
@.STR36 = global [8 x i8] c"error\n\00", align 8
@.STR35 = global [4 x i8] c"foo\00", align 8
@.STR34 = global [8 x i8] c"error\n\00", align 8
@.STR33 = global [4 x i8] c"bar\00", align 8
@.STR32 = global [4 x i8] c"foo\00", align 8
@.STR31 = global [8 x i8] c"error\n\00", align 8
@.STR30 = global [4 x i8] c"foo\00", align 8
; function genGetReg
define i64 @genGetReg() {
.L396:
	%0 = alloca i64, align 8 ; ptr to ret val
	%1 = load i64, ptr @genUsedReg, align 8
	%2 = getelementptr i64, ptr @genLastUsedReg, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = inttoptr i64 %3 to ptr
	store i64 %1, ptr %4, align 8
	%5  = add i64 %1, 0; bloody hack
	store i64 %1, ptr %0, align 8
	%6 = load i64, ptr @genUsedReg, align 8
	; load constant 1 into %7
	%7 = add i64 1, 0
	%8 = add i64 %6, %7
	%9 = getelementptr i64, ptr @genUsedReg, i64 0
	%10 = ptrtoint ptr %9 to i64
	%11 = inttoptr i64 %10 to ptr
	store i64 %8, ptr %11, align 8
	%12  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %0, align 8
	%13 = load i64, ptr @genLastUsedReg, align 8
	store i64 %13, ptr %0, align 8
	br label %.L397
.L397:
	%14= load i64, ptr %0, align 8
	ret i64 %14
}

; function genResetReg
define i64 @genResetReg() {
.L398:
	%0 = alloca i64, align 8 ; ptr to ret val
	; load constant 0 into %1
	%1 = add i64 0, 0
	%2 = getelementptr i64, ptr @genUsedReg, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = inttoptr i64 %3 to ptr
	store i64 %1, ptr %4, align 8
	%5  = add i64 %1, 0; bloody hack
	%6 = getelementptr i64, ptr @genLastUsedReg, i64 0
	%7 = ptrtoint ptr %6 to i64
	%8 = inttoptr i64 %7 to ptr
	store i64 %1, ptr %8, align 8
	%9  = add i64 %1, 0; bloody hack
	store i64 %1, ptr %0, align 8
	br label %.L399
.L399:
	%10= load i64, ptr %0, align 8
	ret i64 %10
}

; function genInitCode
define i64 @genInitCode() {
.L400:
	%0 = alloca i64, align 8 ; ptr to ret val
	%1 = getelementptr i64, ptr @.STR40, i64 0
	%2 = ptrtoint ptr %1 to i64
	%3 = getelementptr i64, ptr @genFunctionBuildingInfo, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %0, align 8
	%7 = getelementptr i64, ptr @.STR41, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = call i64 @println(i64 %8)
	store i64 %9, ptr %0, align 8
	%10 = getelementptr i64, ptr @.STR42, i64 0
	%11 = ptrtoint ptr %10 to i64
	%12 = call i64 @println(i64 %11)
	store i64 %12, ptr %0, align 8
	%13 = getelementptr i64, ptr @.STR43, i64 0
	%14 = ptrtoint ptr %13 to i64
	%15 = call i64 @println(i64 %14)
	store i64 %15, ptr %0, align 8
	%16 = getelementptr i64, ptr @.STR44, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = call i64 @println(i64 %17)
	store i64 %18, ptr %0, align 8
	br label %.L401
.L401:
	%19= load i64, ptr %0, align 8
	ret i64 %19
}

@.STR44 = global [24 x i8] c"declare void @free(i64)\00", align 8
@.STR43 = global [25 x i8] c"declare i64 @malloc(i64)\00", align 8
@.STR42 = global [27 x i8] c"declare void @putchar(i64)\00", align 8
@.STR41 = global [23 x i8] c"declare i32 @getchar()\00", align 8
@.STR40 = global [24 x i8] c"[fnName][bbClos][retRe]\00", align 8
; function genGetLabel
define i64 @genGetLabel() {
.L402:
	%0 = alloca i64, align 8 ; ptr to ret val
	%ret = alloca i64, align 8
	%1 = load i64, ptr @genLabelCount, align 8
	%2 = getelementptr i64, ptr %ret, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = inttoptr i64 %3 to ptr
	store i64 %1, ptr %4, align 8
	%5  = add i64 %1, 0; bloody hack
	store i64 %1, ptr %0, align 8
	%6 = load i64, ptr @genLabelCount, align 8
	; load constant 1 into %7
	%7 = add i64 1, 0
	%8 = add i64 %6, %7
	%9 = getelementptr i64, ptr @genLabelCount, i64 0
	%10 = ptrtoint ptr %9 to i64
	%11 = inttoptr i64 %10 to ptr
	store i64 %8, ptr %11, align 8
	%12  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %0, align 8
	%13 = load i64, ptr %ret, align 8
	store i64 %13, ptr %0, align 8
	br label %.L403
.L403:
	%14= load i64, ptr %0, align 8
	ret i64 %14
}

; function genDefLabel
define i64 @genDefLabel(i64 %0) {
.L404:
	%labelIdent = alloca i64, align 8
	store i64 %0, ptr %labelIdent, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%.TMP19 = alloca i64, align 8
	%2 = load i64, ptr @genFunctionBuildingInfo, align 8
	%3 = inttoptr i64 %2 to ptr
	%4 = load i64, ptr %3, align 8
	%5 = sub i64 %4, 0
	%6 = icmp ne i64 %5, 0
	br i1 %6, label %.L408, label %.L410
.L410:
	%7 = getelementptr i64, ptr %.TMP19, i64 0
	%8 = ptrtoint ptr %7 to i64
	; load constant 0 into %9
	%9 = add i64 0, 0
	%10 = inttoptr i64 %8 to ptr
	store i64 %9, ptr %10, align 8
	%11  = add i64 %9, 0; bloody hack
	; jump to end
	br label %.L407
.L408:
	%12 = load i64, ptr @genFunctionBuildingInfo, align 8
	; load constant 8 into %13
	%13 = add i64 8, 0
	%14 = add i64 %12, %13
	%15 = inttoptr i64 %14 to ptr
	%16 = load i64, ptr %15, align 8
	; load constant 0 into %17
	%17 = add i64 0, 0
	%18 = icmp eq i64 %16, %17
	%19 = zext i1 %18 to i64
	%20 = sub i64 %19, 0
	%21 = icmp ne i64 %20, 0
	br i1 %21, label %.L409, label %.L411
.L411:
	%22 = getelementptr i64, ptr %.TMP19, i64 0
	%23 = ptrtoint ptr %22 to i64
	; load constant 0 into %24
	%24 = add i64 0, 0
	%25 = inttoptr i64 %23 to ptr
	store i64 %24, ptr %25, align 8
	%26  = add i64 %24, 0; bloody hack
	; jump to end
	br label %.L407
.L409:
	%27 = getelementptr i64, ptr %.TMP19, i64 0
	%28 = ptrtoint ptr %27 to i64
	; load constant 1 into %29
	%29 = add i64 1, 0
	%30 = inttoptr i64 %28 to ptr
	store i64 %29, ptr %30, align 8
	%31  = add i64 %29, 0; bloody hack
	br label %.L407
.L407:
	%32 = getelementptr i64, ptr %.TMP19, i64 0
	%33 = ptrtoint ptr %32 to i64
	%34 = inttoptr i64 %33 to ptr
	%35 = load i64, ptr %34, align 8
	%36 = sub i64 %35, 0
	%37 = icmp eq i64 %36, 0
	br i1 %37, label %.L406, label %.L412
.L412:
	%38 = load i64, ptr %labelIdent, align 8
	%39 = call i64 @genJump(i64 %38)
	store i64 %39, ptr %1, align 8
	br label %.L405
.L406:
	br label %.L405
.L405:
	%40 = getelementptr i64, ptr @.STR45, i64 0
	%41 = ptrtoint ptr %40 to i64
	%42 = call i64 @print(i64 %41)
	store i64 %42, ptr %1, align 8
	%43 = load i64, ptr %labelIdent, align 8
	%44 = call i64 @printInt(i64 %43)
	store i64 %44, ptr %1, align 8
	%45 = getelementptr i64, ptr @.STR46, i64 0
	%46 = ptrtoint ptr %45 to i64
	%47 = call i64 @println(i64 %46)
	store i64 %47, ptr %1, align 8
	; load constant 0 into %48
	%48 = add i64 0, 0
	%49 = load i64, ptr @genFunctionBuildingInfo, align 8
	; load constant 8 into %50
	%50 = add i64 8, 0
	%51 = add i64 %49, %50
	%52 = inttoptr i64 %51 to ptr
	store i64 %48, ptr %52, align 8
	%53  = add i64 %48, 0; bloody hack
	store i64 %48, ptr %1, align 8
	br label %.L413
.L413:
	%54= load i64, ptr %1, align 8
	ret i64 %54
}

@.STR46 = global [2 x i8] c":\00", align 8
@.STR45 = global [3 x i8] c".L\00", align 8
; function genJump
define i64 @genJump(i64 %0) {
.L414:
	%labelIdent = alloca i64, align 8
	store i64 %0, ptr %labelIdent, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = getelementptr i64, ptr @.STR47, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = call i64 @print(i64 %3)
	store i64 %4, ptr %1, align 8
	%5 = load i64, ptr %labelIdent, align 8
	%6 = call i64 @printInt(i64 %5)
	store i64 %6, ptr %1, align 8
	; load constant 0 into %7
	%7 = add i64 0, 0
	%8 = call i64 @println(i64 %7)
	store i64 %8, ptr %1, align 8
	; load constant 1 into %9
	%9 = add i64 1, 0
	%10 = load i64, ptr @genFunctionBuildingInfo, align 8
	; load constant 8 into %11
	%11 = add i64 8, 0
	%12 = add i64 %10, %11
	%13 = inttoptr i64 %12 to ptr
	store i64 %9, ptr %13, align 8
	%14  = add i64 %9, 0; bloody hack
	store i64 %9, ptr %1, align 8
	br label %.L415
.L415:
	%15= load i64, ptr %1, align 8
	ret i64 %15
}

@.STR47 = global [14 x i8] c"	br label %.L\00", align 8
; function genJumpIfTrue
define i64 @genJumpIfTrue(i64 %0, i64 %1) {
.L416:
	%condVal = alloca i64, align 8
	store i64 %0, ptr %condVal, align 8
	%labelIdent = alloca i64, align 8
	store i64 %1, ptr %labelIdent, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%condReg = alloca i64, align 8
	%3 = call i64 @genGetReg()
	%4 = getelementptr i64, ptr %condReg, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %2, align 8
	%cmpReg = alloca i64, align 8
	%8 = call i64 @genGetReg()
	%9 = getelementptr i64, ptr %cmpReg, i64 0
	%10 = ptrtoint ptr %9 to i64
	%11 = inttoptr i64 %10 to ptr
	store i64 %8, ptr %11, align 8
	%12  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %2, align 8
	%13 = getelementptr i64, ptr @.STR48, i64 0
	%14 = ptrtoint ptr %13 to i64
	%15 = call i64 @print(i64 %14)
	store i64 %15, ptr %2, align 8
	%16 = load i64, ptr %condReg, align 8
	%17 = call i64 @printInt(i64 %16)
	store i64 %17, ptr %2, align 8
	%18 = getelementptr i64, ptr @.STR49, i64 0
	%19 = ptrtoint ptr %18 to i64
	%20 = call i64 @print(i64 %19)
	store i64 %20, ptr %2, align 8
	%21 = load i64, ptr %condVal, align 8
	%22 = call i64 @printInt(i64 %21)
	store i64 %22, ptr %2, align 8
	%23 = getelementptr i64, ptr @.STR50, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = call i64 @println(i64 %24)
	store i64 %25, ptr %2, align 8
	%26 = getelementptr i64, ptr @.STR51, i64 0
	%27 = ptrtoint ptr %26 to i64
	%28 = call i64 @print(i64 %27)
	store i64 %28, ptr %2, align 8
	%29 = load i64, ptr %cmpReg, align 8
	%30 = call i64 @printInt(i64 %29)
	store i64 %30, ptr %2, align 8
	%31 = getelementptr i64, ptr @.STR52, i64 0
	%32 = ptrtoint ptr %31 to i64
	%33 = call i64 @print(i64 %32)
	store i64 %33, ptr %2, align 8
	%34 = load i64, ptr %condReg, align 8
	%35 = call i64 @printInt(i64 %34)
	store i64 %35, ptr %2, align 8
	%36 = getelementptr i64, ptr @.STR53, i64 0
	%37 = ptrtoint ptr %36 to i64
	%38 = call i64 @println(i64 %37)
	store i64 %38, ptr %2, align 8
	%contLabel = alloca i64, align 8
	%39 = call i64 @genGetLabel()
	%40 = getelementptr i64, ptr %contLabel, i64 0
	%41 = ptrtoint ptr %40 to i64
	%42 = inttoptr i64 %41 to ptr
	store i64 %39, ptr %42, align 8
	%43  = add i64 %39, 0; bloody hack
	store i64 %39, ptr %2, align 8
	%44 = getelementptr i64, ptr @.STR54, i64 0
	%45 = ptrtoint ptr %44 to i64
	%46 = call i64 @print(i64 %45)
	store i64 %46, ptr %2, align 8
	%47 = load i64, ptr %cmpReg, align 8
	%48 = call i64 @printInt(i64 %47)
	store i64 %48, ptr %2, align 8
	%49 = getelementptr i64, ptr @.STR55, i64 0
	%50 = ptrtoint ptr %49 to i64
	%51 = call i64 @print(i64 %50)
	store i64 %51, ptr %2, align 8
	%52 = load i64, ptr %labelIdent, align 8
	%53 = call i64 @printInt(i64 %52)
	store i64 %53, ptr %2, align 8
	%54 = getelementptr i64, ptr @.STR56, i64 0
	%55 = ptrtoint ptr %54 to i64
	%56 = call i64 @print(i64 %55)
	store i64 %56, ptr %2, align 8
	%57 = load i64, ptr %contLabel, align 8
	%58 = call i64 @printInt(i64 %57)
	store i64 %58, ptr %2, align 8
	; load constant 0 into %59
	%59 = add i64 0, 0
	%60 = call i64 @println(i64 %59)
	store i64 %60, ptr %2, align 8
	; load constant 1 into %61
	%61 = add i64 1, 0
	%62 = load i64, ptr @genFunctionBuildingInfo, align 8
	; load constant 8 into %63
	%63 = add i64 8, 0
	%64 = add i64 %62, %63
	%65 = inttoptr i64 %64 to ptr
	store i64 %61, ptr %65, align 8
	%66  = add i64 %61, 0; bloody hack
	store i64 %61, ptr %2, align 8
	%67 = load i64, ptr %contLabel, align 8
	%68 = call i64 @genDefLabel(i64 %67)
	store i64 %68, ptr %2, align 8
	br label %.L417
.L417:
	%69= load i64, ptr %2, align 8
	ret i64 %69
}

@.STR56 = global [12 x i8] c", label %.L\00", align 8
@.STR55 = global [12 x i8] c", label %.L\00", align 8
@.STR54 = global [9 x i8] c"	br i1 %\00", align 8
@.STR53 = global [4 x i8] c", 0\00", align 8
@.STR52 = global [17 x i8] c" = icmp ne i64 %\00", align 8
@.STR51 = global [3 x i8] c"	%\00", align 8
@.STR50 = global [4 x i8] c", 0\00", align 8
@.STR49 = global [13 x i8] c" = sub i64 %\00", align 8
@.STR48 = global [3 x i8] c"	%\00", align 8
; function genJumpIfFalse
define i64 @genJumpIfFalse(i64 %0, i64 %1) {
.L418:
	%condVal = alloca i64, align 8
	store i64 %0, ptr %condVal, align 8
	%labelIdent = alloca i64, align 8
	store i64 %1, ptr %labelIdent, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%condReg = alloca i64, align 8
	%3 = call i64 @genGetReg()
	%4 = getelementptr i64, ptr %condReg, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %2, align 8
	%cmpReg = alloca i64, align 8
	%8 = call i64 @genGetReg()
	%9 = getelementptr i64, ptr %cmpReg, i64 0
	%10 = ptrtoint ptr %9 to i64
	%11 = inttoptr i64 %10 to ptr
	store i64 %8, ptr %11, align 8
	%12  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %2, align 8
	%13 = getelementptr i64, ptr @.STR57, i64 0
	%14 = ptrtoint ptr %13 to i64
	%15 = call i64 @print(i64 %14)
	store i64 %15, ptr %2, align 8
	%16 = load i64, ptr %condReg, align 8
	%17 = call i64 @printInt(i64 %16)
	store i64 %17, ptr %2, align 8
	%18 = getelementptr i64, ptr @.STR58, i64 0
	%19 = ptrtoint ptr %18 to i64
	%20 = call i64 @print(i64 %19)
	store i64 %20, ptr %2, align 8
	%21 = load i64, ptr %condVal, align 8
	%22 = call i64 @printInt(i64 %21)
	store i64 %22, ptr %2, align 8
	%23 = getelementptr i64, ptr @.STR59, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = call i64 @println(i64 %24)
	store i64 %25, ptr %2, align 8
	%26 = getelementptr i64, ptr @.STR60, i64 0
	%27 = ptrtoint ptr %26 to i64
	%28 = call i64 @print(i64 %27)
	store i64 %28, ptr %2, align 8
	%29 = load i64, ptr %cmpReg, align 8
	%30 = call i64 @printInt(i64 %29)
	store i64 %30, ptr %2, align 8
	%31 = getelementptr i64, ptr @.STR61, i64 0
	%32 = ptrtoint ptr %31 to i64
	%33 = call i64 @print(i64 %32)
	store i64 %33, ptr %2, align 8
	%34 = load i64, ptr %condReg, align 8
	%35 = call i64 @printInt(i64 %34)
	store i64 %35, ptr %2, align 8
	%36 = getelementptr i64, ptr @.STR62, i64 0
	%37 = ptrtoint ptr %36 to i64
	%38 = call i64 @println(i64 %37)
	store i64 %38, ptr %2, align 8
	%contLabel = alloca i64, align 8
	%39 = call i64 @genGetLabel()
	%40 = getelementptr i64, ptr %contLabel, i64 0
	%41 = ptrtoint ptr %40 to i64
	%42 = inttoptr i64 %41 to ptr
	store i64 %39, ptr %42, align 8
	%43  = add i64 %39, 0; bloody hack
	store i64 %39, ptr %2, align 8
	%44 = getelementptr i64, ptr @.STR63, i64 0
	%45 = ptrtoint ptr %44 to i64
	%46 = call i64 @print(i64 %45)
	store i64 %46, ptr %2, align 8
	%47 = load i64, ptr %cmpReg, align 8
	%48 = call i64 @printInt(i64 %47)
	store i64 %48, ptr %2, align 8
	%49 = getelementptr i64, ptr @.STR64, i64 0
	%50 = ptrtoint ptr %49 to i64
	%51 = call i64 @print(i64 %50)
	store i64 %51, ptr %2, align 8
	%52 = load i64, ptr %labelIdent, align 8
	%53 = call i64 @printInt(i64 %52)
	store i64 %53, ptr %2, align 8
	%54 = getelementptr i64, ptr @.STR65, i64 0
	%55 = ptrtoint ptr %54 to i64
	%56 = call i64 @print(i64 %55)
	store i64 %56, ptr %2, align 8
	%57 = load i64, ptr %contLabel, align 8
	%58 = call i64 @printInt(i64 %57)
	store i64 %58, ptr %2, align 8
	; load constant 0 into %59
	%59 = add i64 0, 0
	%60 = call i64 @println(i64 %59)
	store i64 %60, ptr %2, align 8
	; load constant 1 into %61
	%61 = add i64 1, 0
	%62 = load i64, ptr @genFunctionBuildingInfo, align 8
	; load constant 8 into %63
	%63 = add i64 8, 0
	%64 = add i64 %62, %63
	%65 = inttoptr i64 %64 to ptr
	store i64 %61, ptr %65, align 8
	%66  = add i64 %61, 0; bloody hack
	store i64 %61, ptr %2, align 8
	%67 = load i64, ptr %contLabel, align 8
	%68 = call i64 @genDefLabel(i64 %67)
	store i64 %68, ptr %2, align 8
	br label %.L419
.L419:
	%69= load i64, ptr %2, align 8
	ret i64 %69
}

@.STR65 = global [12 x i8] c", label %.L\00", align 8
@.STR64 = global [12 x i8] c", label %.L\00", align 8
@.STR63 = global [9 x i8] c"	br i1 %\00", align 8
@.STR62 = global [4 x i8] c", 0\00", align 8
@.STR61 = global [17 x i8] c" = icmp eq i64 %\00", align 8
@.STR60 = global [3 x i8] c"	%\00", align 8
@.STR59 = global [4 x i8] c", 0\00", align 8
@.STR58 = global [13 x i8] c" = sub i64 %\00", align 8
@.STR57 = global [3 x i8] c"	%\00", align 8
; function genDefString
define i64 @genDefString(i64 %0) {
.L420:
	%val = alloca i64, align 8
	store i64 %0, ptr %val, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%name = alloca i64, align 8
	%2 = getelementptr i64, ptr @.STR66, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = getelementptr i64, ptr %name, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %1, align 8
	%8 = load i64, ptr %name, align 8
	; load constant 4 into %9
	%9 = add i64 4, 0
	%10 = add i64 %8, %9
	%11 = load i64, ptr @genStringCount, align 8
	%12 = call i64 @sprintInt(i64 %11, i64 %10)
	store i64 %12, ptr %1, align 8
	%13 = load i64, ptr @genStringCount, align 8
	; load constant 1 into %14
	%14 = add i64 1, 0
	%15 = add i64 %13, %14
	%16 = getelementptr i64, ptr @genStringCount, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = inttoptr i64 %17 to ptr
	store i64 %15, ptr %18, align 8
	%19  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %1, align 8
	%ident = alloca i64, align 8
	%20 = load i64, ptr %name, align 8
	%21 = call i64 @UStrCreate(i64 %20)
	%22 = getelementptr i64, ptr %ident, i64 0
	%23 = ptrtoint ptr %22 to i64
	%24 = inttoptr i64 %23 to ptr
	store i64 %21, ptr %24, align 8
	%25  = add i64 %21, 0; bloody hack
	store i64 %21, ptr %1, align 8
	%n = alloca i64, align 8
	; load constant 24 into %26
	%26 = add i64 24, 0
	%27 = call i64 @malloc(i64 %26)
	%28 = getelementptr i64, ptr %n, i64 0
	%29 = ptrtoint ptr %28 to i64
	%30 = inttoptr i64 %29 to ptr
	store i64 %27, ptr %30, align 8
	%31  = add i64 %27, 0; bloody hack
	store i64 %27, ptr %1, align 8
	%32 = load i64, ptr @genStringList, align 8
	%33 = load i64, ptr %n, align 8
	; load constant 0 into %34
	%34 = add i64 0, 0
	%35 = add i64 %33, %34
	%36 = inttoptr i64 %35 to ptr
	store i64 %32, ptr %36, align 8
	%37  = add i64 %32, 0; bloody hack
	store i64 %32, ptr %1, align 8
	%38 = load i64, ptr %ident, align 8
	%39 = load i64, ptr %n, align 8
	; load constant 8 into %40
	%40 = add i64 8, 0
	%41 = add i64 %39, %40
	%42 = inttoptr i64 %41 to ptr
	store i64 %38, ptr %42, align 8
	%43  = add i64 %38, 0; bloody hack
	store i64 %38, ptr %1, align 8
	%44 = load i64, ptr %val, align 8
	%45 = call i64 @strlen(i64 %44)
	; load constant 1 into %46
	%46 = add i64 1, 0
	%47 = add i64 %45, %46
	%48 = call i64 @malloc(i64 %47)
	%49 = load i64, ptr %n, align 8
	; load constant 16 into %50
	%50 = add i64 16, 0
	%51 = add i64 %49, %50
	%52 = inttoptr i64 %51 to ptr
	store i64 %48, ptr %52, align 8
	%53  = add i64 %48, 0; bloody hack
	store i64 %48, ptr %1, align 8
	%54 = load i64, ptr %val, align 8
	%55 = load i64, ptr %n, align 8
	; load constant 16 into %56
	%56 = add i64 16, 0
	%57 = add i64 %55, %56
	%58 = inttoptr i64 %57 to ptr
	%59 = load i64, ptr %58, align 8
	%60 = call i64 @strcpy(i64 %59, i64 %54)
	store i64 %60, ptr %1, align 8
	%61 = load i64, ptr %val, align 8
	%62 = call i64 @strlen(i64 %61)
	; load constant 1 into %63
	%63 = add i64 1, 0
	%64 = add i64 %62, %63
	%65 = call i64 @malloc(i64 %64)
	%66 = load i64, ptr %n, align 8
	; load constant 16 into %67
	%67 = add i64 16, 0
	%68 = add i64 %66, %67
	%69 = inttoptr i64 %68 to ptr
	store i64 %65, ptr %69, align 8
	%70  = add i64 %65, 0; bloody hack
	store i64 %65, ptr %1, align 8
	%71 = load i64, ptr %val, align 8
	%72 = load i64, ptr %n, align 8
	; load constant 16 into %73
	%73 = add i64 16, 0
	%74 = add i64 %72, %73
	%75 = inttoptr i64 %74 to ptr
	%76 = load i64, ptr %75, align 8
	%77 = call i64 @strcpy(i64 %76, i64 %71)
	store i64 %77, ptr %1, align 8
	; load constant 0 into %78
	%78 = add i64 0, 0
	%79 = load i64, ptr %n, align 8
	; load constant 16 into %80
	%80 = add i64 16, 0
	%81 = add i64 %79, %80
	%82 = inttoptr i64 %81 to ptr
	%83 = load i64, ptr %82, align 8
	%84 = load i64, ptr %n, align 8
	; load constant 16 into %85
	%85 = add i64 16, 0
	%86 = add i64 %84, %85
	%87 = inttoptr i64 %86 to ptr
	%88 = load i64, ptr %87, align 8
	%89 = call i64 @strlen(i64 %88)
	%90 = add i64 %83, %89
	; load constant 1 into %91
	%91 = add i64 1, 0
	%92 = sub i64 %90, %91
	%93 = inttoptr i64 %92 to ptr
	%94 = trunc i64 %78 to i8
	store i8 %94, ptr %93, align 8
	%95  = add i64 %78, 0; bloody hack
	store i64 %78, ptr %1, align 8
	%96 = load i64, ptr %n, align 8
	%97 = getelementptr i64, ptr @genStringList, i64 0
	%98 = ptrtoint ptr %97 to i64
	%99 = inttoptr i64 %98 to ptr
	store i64 %96, ptr %99, align 8
	%100  = add i64 %96, 0; bloody hack
	store i64 %96, ptr %1, align 8
	%101 = load i64, ptr %ident, align 8
	store i64 %101, ptr %1, align 8
	br label %.L421
.L421:
	%102= load i64, ptr %1, align 8
	ret i64 %102
}

@.STR66 = global [15 x i8] c".STRxxxxxxxxxx\00", align 8
; function genPrintStringList
define i64 @genPrintStringList() {
.L422:
	%0 = alloca i64, align 8 ; ptr to ret val
	br label %.L423
.L423:
	%1 = load i64, ptr @genStringList, align 8
	%2 = sub i64 %1, 0
	%3 = icmp eq i64 %2, 0
	br i1 %3, label %.L424, label %.L425
.L425:
	%4 = getelementptr i64, ptr @.STR67, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = call i64 @print(i64 %5)
	store i64 %6, ptr %0, align 8
	%7 = load i64, ptr @genStringList, align 8
	; load constant 8 into %8
	%8 = add i64 8, 0
	%9 = add i64 %7, %8
	%10 = inttoptr i64 %9 to ptr
	%11 = load i64, ptr %10, align 8
	%12 = call i64 @print(i64 %11)
	store i64 %12, ptr %0, align 8
	%13 = getelementptr i64, ptr @.STR68, i64 0
	%14 = ptrtoint ptr %13 to i64
	%15 = call i64 @print(i64 %14)
	store i64 %15, ptr %0, align 8
	%16 = load i64, ptr @genStringList, align 8
	; load constant 16 into %17
	%17 = add i64 16, 0
	%18 = add i64 %16, %17
	%19 = inttoptr i64 %18 to ptr
	%20 = load i64, ptr %19, align 8
	%21 = call i64 @strlen(i64 %20)
	%22 = call i64 @printInt(i64 %21)
	store i64 %22, ptr %0, align 8
	%23 = getelementptr i64, ptr @.STR69, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = call i64 @print(i64 %24)
	store i64 %25, ptr %0, align 8
	%26 = load i64, ptr @genStringList, align 8
	; load constant 16 into %27
	%27 = add i64 16, 0
	%28 = add i64 %26, %27
	%29 = inttoptr i64 %28 to ptr
	%30 = load i64, ptr %29, align 8
	%31 = call i64 @print(i64 %30)
	store i64 %31, ptr %0, align 8
	; load constant 92 into %32
	%32 = add i64 92, 0
	%33 = call i64 @putchar(i64 %32)
	store i64 %33, ptr %0, align 8
	%34 = getelementptr i64, ptr @.STR70, i64 0
	%35 = ptrtoint ptr %34 to i64
	%36 = call i64 @print(i64 %35)
	store i64 %36, ptr %0, align 8
	; load constant 34 into %37
	%37 = add i64 34, 0
	%38 = call i64 @putchar(i64 %37)
	store i64 %38, ptr %0, align 8
	%39 = getelementptr i64, ptr @.STR71, i64 0
	%40 = ptrtoint ptr %39 to i64
	%41 = call i64 @println(i64 %40)
	store i64 %41, ptr %0, align 8
	%n = alloca i64, align 8
	%42 = load i64, ptr @genStringList, align 8
	%43 = getelementptr i64, ptr %n, i64 0
	%44 = ptrtoint ptr %43 to i64
	%45 = inttoptr i64 %44 to ptr
	store i64 %42, ptr %45, align 8
	%46  = add i64 %42, 0; bloody hack
	store i64 %42, ptr %0, align 8
	%47 = load i64, ptr @genStringList, align 8
	%48 = inttoptr i64 %47 to ptr
	%49 = load i64, ptr %48, align 8
	%50 = getelementptr i64, ptr @genStringList, i64 0
	%51 = ptrtoint ptr %50 to i64
	%52 = inttoptr i64 %51 to ptr
	store i64 %49, ptr %52, align 8
	%53  = add i64 %49, 0; bloody hack
	store i64 %49, ptr %0, align 8
	%54 = load i64, ptr %n, align 8
	; load constant 16 into %55
	%55 = add i64 16, 0
	%56 = add i64 %54, %55
	%57 = inttoptr i64 %56 to ptr
	%58 = load i64, ptr %57, align 8
	%59 = call i64 @free(i64 %58)
	store i64 %59, ptr %0, align 8
	%60 = load i64, ptr %n, align 8
	%61 = call i64 @free(i64 %60)
	store i64 %61, ptr %0, align 8
	br label %.L423
.L424:
	br label %.L426
.L426:
	%62= load i64, ptr %0, align 8
	ret i64 %62
}

@.STR71 = global [10 x i8] c", align 8\00", align 8
@.STR70 = global [3 x i8] c"00\00", align 8
@.STR69 = global [9 x i8] c" x i8] c\00", align 8
@.STR68 = global [12 x i8] c" = global [\00", align 8
@.STR67 = global [2 x i8] c"@\00", align 8
; function parseEscape
define i64 @parseEscape(i64 %0) {
.L427:
	%c = alloca i64, align 8
	store i64 %0, ptr %c, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%ascii = alloca i64, align 8
	%2 = load i64, ptr %c, align 8
	; load constant 'n' into %3
	%3 = add i64 110, 0
	%4 = icmp eq i64 %2, %3
	%5 = zext i1 %4 to i64
	%6 = sub i64 %5, 0
	%7 = icmp eq i64 %6, 0
	br i1 %7, label %.L429, label %.L430
.L430:
	; load constant '\n' into %8
	%8 = add i64 10, 0
	%9 = getelementptr i64, ptr %ascii, i64 0
	%10 = ptrtoint ptr %9 to i64
	%11 = inttoptr i64 %10 to ptr
	store i64 %8, ptr %11, align 8
	%12  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %1, align 8
	br label %.L428
.L429:
	%13 = load i64, ptr %c, align 8
	; load constant 't' into %14
	%14 = add i64 116, 0
	%15 = icmp eq i64 %13, %14
	%16 = zext i1 %15 to i64
	%17 = sub i64 %16, 0
	%18 = icmp eq i64 %17, 0
	br i1 %18, label %.L432, label %.L433
.L433:
	; load constant '\t' into %19
	%19 = add i64 9, 0
	%20 = getelementptr i64, ptr %ascii, i64 0
	%21 = ptrtoint ptr %20 to i64
	%22 = inttoptr i64 %21 to ptr
	store i64 %19, ptr %22, align 8
	%23  = add i64 %19, 0; bloody hack
	store i64 %19, ptr %1, align 8
	br label %.L431
.L432:
	%24 = load i64, ptr %c, align 8
	; load constant 'r' into %25
	%25 = add i64 114, 0
	%26 = icmp eq i64 %24, %25
	%27 = zext i1 %26 to i64
	%28 = sub i64 %27, 0
	%29 = icmp eq i64 %28, 0
	br i1 %29, label %.L435, label %.L436
.L436:
	; load constant '\r' into %30
	%30 = add i64 13, 0
	%31 = getelementptr i64, ptr %ascii, i64 0
	%32 = ptrtoint ptr %31 to i64
	%33 = inttoptr i64 %32 to ptr
	store i64 %30, ptr %33, align 8
	%34  = add i64 %30, 0; bloody hack
	store i64 %30, ptr %1, align 8
	br label %.L434
.L435:
	%35 = load i64, ptr %c, align 8
	; load constant '0' into %36
	%36 = add i64 48, 0
	%37 = icmp eq i64 %35, %36
	%38 = zext i1 %37 to i64
	%39 = sub i64 %38, 0
	%40 = icmp eq i64 %39, 0
	br i1 %40, label %.L438, label %.L439
.L439:
	; load constant '\0' into %41
	%41 = add i64 0, 0
	%42 = getelementptr i64, ptr %ascii, i64 0
	%43 = ptrtoint ptr %42 to i64
	%44 = inttoptr i64 %43 to ptr
	store i64 %41, ptr %44, align 8
	%45  = add i64 %41, 0; bloody hack
	store i64 %41, ptr %1, align 8
	br label %.L437
.L438:
	%46 = load i64, ptr %c, align 8
	; load constant '\\' into %47
	%47 = add i64 92, 0
	%48 = icmp eq i64 %46, %47
	%49 = zext i1 %48 to i64
	%50 = sub i64 %49, 0
	%51 = icmp eq i64 %50, 0
	br i1 %51, label %.L441, label %.L442
.L442:
	; load constant '\\' into %52
	%52 = add i64 92, 0
	%53 = getelementptr i64, ptr %ascii, i64 0
	%54 = ptrtoint ptr %53 to i64
	%55 = inttoptr i64 %54 to ptr
	store i64 %52, ptr %55, align 8
	%56  = add i64 %52, 0; bloody hack
	store i64 %52, ptr %1, align 8
	br label %.L440
.L441:
	%57 = load i64, ptr %c, align 8
	; load constant '\'' into %58
	%58 = add i64 39, 0
	%59 = icmp eq i64 %57, %58
	%60 = zext i1 %59 to i64
	%61 = sub i64 %60, 0
	%62 = icmp eq i64 %61, 0
	br i1 %62, label %.L444, label %.L445
.L445:
	; load constant '\'' into %63
	%63 = add i64 39, 0
	%64 = getelementptr i64, ptr %ascii, i64 0
	%65 = ptrtoint ptr %64 to i64
	%66 = inttoptr i64 %65 to ptr
	store i64 %63, ptr %66, align 8
	%67  = add i64 %63, 0; bloody hack
	store i64 %63, ptr %1, align 8
	br label %.L443
.L444:
	%68 = load i64, ptr %c, align 8
	; load constant '"' into %69
	%69 = add i64 34, 0
	%70 = icmp eq i64 %68, %69
	%71 = zext i1 %70 to i64
	%72 = sub i64 %71, 0
	%73 = icmp eq i64 %72, 0
	br i1 %73, label %.L447, label %.L448
.L448:
	; load constant '"' into %74
	%74 = add i64 34, 0
	%75 = getelementptr i64, ptr %ascii, i64 0
	%76 = ptrtoint ptr %75 to i64
	%77 = inttoptr i64 %76 to ptr
	store i64 %74, ptr %77, align 8
	%78  = add i64 %74, 0; bloody hack
	store i64 %74, ptr %1, align 8
	br label %.L446
.L447:
	%79 = load i64, ptr %c, align 8
	%80 = getelementptr i64, ptr %ascii, i64 0
	%81 = ptrtoint ptr %80 to i64
	%82 = inttoptr i64 %81 to ptr
	store i64 %79, ptr %82, align 8
	%83  = add i64 %79, 0; bloody hack
	store i64 %79, ptr %1, align 8
	br label %.L446
.L446:
	br label %.L443
.L443:
	br label %.L440
.L440:
	br label %.L437
.L437:
	br label %.L434
.L434:
	br label %.L431
.L431:
	br label %.L428
.L428:
	%84 = load i64, ptr %ascii, align 8
	store i64 %84, ptr %1, align 8
	br label %.L449
.L449:
	%85= load i64, ptr %1, align 8
	ret i64 %85
}

; function genConstant
define i64 @genConstant(i64 %0) {
.L450:
	%val = alloca i64, align 8
	store i64 %0, ptr %val, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%reg = alloca i64, align 8
	%2 = call i64 @genGetReg()
	%3 = getelementptr i64, ptr %reg, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %1, align 8
	%7 = getelementptr i64, ptr @.STR72, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = call i64 @print(i64 %8)
	store i64 %9, ptr %1, align 8
	%10 = load i64, ptr %val, align 8
	%11 = call i64 @print(i64 %10)
	store i64 %11, ptr %1, align 8
	%12 = getelementptr i64, ptr @.STR73, i64 0
	%13 = ptrtoint ptr %12 to i64
	%14 = call i64 @print(i64 %13)
	store i64 %14, ptr %1, align 8
	%15 = load i64, ptr %reg, align 8
	%16 = call i64 @printInt(i64 %15)
	store i64 %16, ptr %1, align 8
	; load constant 0 into %17
	%17 = add i64 0, 0
	%18 = call i64 @println(i64 %17)
	store i64 %18, ptr %1, align 8
	%19 = load i64, ptr %val, align 8
	%20 = inttoptr i64 %19 to ptr
	%21 = load i8, ptr %20, align 8
	%22 = zext i8 %21 to i64
	; load constant '\'' into %23
	%23 = add i64 39, 0
	%24 = icmp eq i64 %22, %23
	%25 = zext i1 %24 to i64
	%26 = sub i64 %25, 0
	%27 = icmp eq i64 %26, 0
	br i1 %27, label %.L452, label %.L453
.L453:
	%ascii = alloca i64, align 8
	%28 = load i64, ptr %val, align 8
	; load constant 1 into %29
	%29 = add i64 1, 0
	%30 = add i64 %28, %29
	%31 = inttoptr i64 %30 to ptr
	%32 = load i8, ptr %31, align 8
	%33 = zext i8 %32 to i64
	; load constant '\\' into %34
	%34 = add i64 92, 0
	%35 = icmp eq i64 %33, %34
	%36 = zext i1 %35 to i64
	%37 = sub i64 %36, 0
	%38 = icmp eq i64 %37, 0
	br i1 %38, label %.L455, label %.L456
.L456:
	%39 = load i64, ptr %val, align 8
	; load constant 2 into %40
	%40 = add i64 2, 0
	%41 = add i64 %39, %40
	%42 = inttoptr i64 %41 to ptr
	%43 = load i8, ptr %42, align 8
	%44 = zext i8 %43 to i64
	%45 = call i64 @parseEscape(i64 %44)
	%46 = getelementptr i64, ptr %ascii, i64 0
	%47 = ptrtoint ptr %46 to i64
	%48 = inttoptr i64 %47 to ptr
	store i64 %45, ptr %48, align 8
	%49  = add i64 %45, 0; bloody hack
	store i64 %45, ptr %1, align 8
	br label %.L454
.L455:
	%50 = load i64, ptr %val, align 8
	; load constant 1 into %51
	%51 = add i64 1, 0
	%52 = add i64 %50, %51
	%53 = inttoptr i64 %52 to ptr
	%54 = load i8, ptr %53, align 8
	%55 = zext i8 %54 to i64
	%56 = getelementptr i64, ptr %ascii, i64 0
	%57 = ptrtoint ptr %56 to i64
	%58 = inttoptr i64 %57 to ptr
	store i64 %55, ptr %58, align 8
	%59  = add i64 %55, 0; bloody hack
	store i64 %55, ptr %1, align 8
	br label %.L454
.L454:
	%60 = getelementptr i64, ptr @.STR74, i64 0
	%61 = ptrtoint ptr %60 to i64
	%62 = call i64 @print(i64 %61)
	store i64 %62, ptr %1, align 8
	%63 = load i64, ptr %reg, align 8
	%64 = call i64 @printInt(i64 %63)
	store i64 %64, ptr %1, align 8
	%65 = getelementptr i64, ptr @.STR75, i64 0
	%66 = ptrtoint ptr %65 to i64
	%67 = call i64 @print(i64 %66)
	store i64 %67, ptr %1, align 8
	%68 = load i64, ptr %ascii, align 8
	%69 = call i64 @printInt(i64 %68)
	store i64 %69, ptr %1, align 8
	%70 = getelementptr i64, ptr @.STR76, i64 0
	%71 = ptrtoint ptr %70 to i64
	%72 = call i64 @println(i64 %71)
	store i64 %72, ptr %1, align 8
	br label %.L451
.L452:
	%73 = getelementptr i64, ptr @.STR77, i64 0
	%74 = ptrtoint ptr %73 to i64
	%75 = call i64 @print(i64 %74)
	store i64 %75, ptr %1, align 8
	%76 = load i64, ptr %reg, align 8
	%77 = call i64 @printInt(i64 %76)
	store i64 %77, ptr %1, align 8
	%78 = getelementptr i64, ptr @.STR78, i64 0
	%79 = ptrtoint ptr %78 to i64
	%80 = call i64 @print(i64 %79)
	store i64 %80, ptr %1, align 8
	%81 = load i64, ptr %val, align 8
	%82 = call i64 @print(i64 %81)
	store i64 %82, ptr %1, align 8
	%83 = getelementptr i64, ptr @.STR79, i64 0
	%84 = ptrtoint ptr %83 to i64
	%85 = call i64 @println(i64 %84)
	store i64 %85, ptr %1, align 8
	br label %.L451
.L451:
	%86 = load i64, ptr %reg, align 8
	store i64 %86, ptr %1, align 8
	br label %.L457
.L457:
	%87= load i64, ptr %1, align 8
	ret i64 %87
}

@.STR79 = global [4 x i8] c", 0\00", align 8
@.STR78 = global [12 x i8] c" = add i64 \00", align 8
@.STR77 = global [3 x i8] c"	%\00", align 8
@.STR76 = global [4 x i8] c", 0\00", align 8
@.STR75 = global [12 x i8] c" = add i64 \00", align 8
@.STR74 = global [3 x i8] c"	%\00", align 8
@.STR73 = global [8 x i8] c" into %\00", align 8
@.STR72 = global [18 x i8] c"	; load constant \00", align 8
; function genFuncDefParam
define i64 @genFuncDefParam(i64 %0) {
.L458:
	%ident = alloca i64, align 8
	store i64 %0, ptr %ident, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%n = alloca i64, align 8
	; load constant 24 into %2
	%2 = add i64 24, 0
	%3 = call i64 @malloc(i64 %2)
	%4 = getelementptr i64, ptr %n, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %1, align 8
	; load constant 0 into %8
	%8 = add i64 0, 0
	%9 = load i64, ptr %n, align 8
	; load constant 0 into %10
	%10 = add i64 0, 0
	%11 = add i64 %9, %10
	%12 = inttoptr i64 %11 to ptr
	store i64 %8, ptr %12, align 8
	%13  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %1, align 8
	%14 = load i64, ptr %ident, align 8
	%15 = load i64, ptr %n, align 8
	; load constant 8 into %16
	%16 = add i64 8, 0
	%17 = add i64 %15, %16
	%18 = inttoptr i64 %17 to ptr
	store i64 %14, ptr %18, align 8
	%19  = add i64 %14, 0; bloody hack
	store i64 %14, ptr %1, align 8
	%20 = load i64, ptr @genFnParamList, align 8
	; load constant 0 into %21
	%21 = add i64 0, 0
	%22 = icmp eq i64 %20, %21
	%23 = zext i1 %22 to i64
	%24 = sub i64 %23, 0
	%25 = icmp eq i64 %24, 0
	br i1 %25, label %.L460, label %.L461
.L461:
	%26 = load i64, ptr %n, align 8
	%27 = getelementptr i64, ptr @genFnParamListLast, i64 0
	%28 = ptrtoint ptr %27 to i64
	%29 = inttoptr i64 %28 to ptr
	store i64 %26, ptr %29, align 8
	%30  = add i64 %26, 0; bloody hack
	%31 = getelementptr i64, ptr @genFnParamList, i64 0
	%32 = ptrtoint ptr %31 to i64
	%33 = inttoptr i64 %32 to ptr
	store i64 %26, ptr %33, align 8
	%34  = add i64 %26, 0; bloody hack
	store i64 %26, ptr %1, align 8
	br label %.L459
.L460:
	%35 = load i64, ptr %n, align 8
	%36 = load i64, ptr @genFnParamListLast, align 8
	%37 = inttoptr i64 %36 to ptr
	store i64 %35, ptr %37, align 8
	%38  = add i64 %35, 0; bloody hack
	%39 = getelementptr i64, ptr @genFnParamListLast, i64 0
	%40 = ptrtoint ptr %39 to i64
	%41 = inttoptr i64 %40 to ptr
	store i64 %35, ptr %41, align 8
	%42  = add i64 %35, 0; bloody hack
	store i64 %35, ptr %1, align 8
	br label %.L459
.L459:
	; load constant 0 into %43
	%43 = add i64 0, 0
	%44 = load i64, ptr %ident, align 8
	%45 = call i64 @symtabAddLocal(i64 %44, i64 %43)
	store i64 %45, ptr %1, align 8
	br label %.L462
.L462:
	%46= load i64, ptr %1, align 8
	ret i64 %46
}

; function genFuncDefBegin
define i64 @genFuncDefBegin(i64 %0) {
.L463:
	%name = alloca i64, align 8
	store i64 %0, ptr %name, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = call i64 @genResetReg()
	store i64 %2, ptr %1, align 8
	%3 = getelementptr i64, ptr @.STR80, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = call i64 @print(i64 %4)
	store i64 %5, ptr %1, align 8
	%6 = load i64, ptr %name, align 8
	%7 = call i64 @println(i64 %6)
	store i64 %7, ptr %1, align 8
	%8 = getelementptr i64, ptr @.STR81, i64 0
	%9 = ptrtoint ptr %8 to i64
	%10 = call i64 @print(i64 %9)
	store i64 %10, ptr %1, align 8
	%11 = load i64, ptr %name, align 8
	%12 = call i64 @print(i64 %11)
	store i64 %12, ptr %1, align 8
	%13 = getelementptr i64, ptr @.STR82, i64 0
	%14 = ptrtoint ptr %13 to i64
	%15 = call i64 @print(i64 %14)
	store i64 %15, ptr %1, align 8
	%n = alloca i64, align 8
	%16 = load i64, ptr @genFnParamList, align 8
	%17 = getelementptr i64, ptr %n, i64 0
	%18 = ptrtoint ptr %17 to i64
	%19 = inttoptr i64 %18 to ptr
	store i64 %16, ptr %19, align 8
	%20  = add i64 %16, 0; bloody hack
	store i64 %16, ptr %1, align 8
	br label %.L464
.L464:
	%21 = load i64, ptr %n, align 8
	%22 = sub i64 %21, 0
	%23 = icmp eq i64 %22, 0
	br i1 %23, label %.L465, label %.L466
.L466:
	%24 = call i64 @genGetReg()
	%25 = load i64, ptr %n, align 8
	; load constant 16 into %26
	%26 = add i64 16, 0
	%27 = add i64 %25, %26
	%28 = inttoptr i64 %27 to ptr
	store i64 %24, ptr %28, align 8
	%29  = add i64 %24, 0; bloody hack
	store i64 %24, ptr %1, align 8
	%30 = getelementptr i64, ptr @.STR83, i64 0
	%31 = ptrtoint ptr %30 to i64
	%32 = call i64 @print(i64 %31)
	store i64 %32, ptr %1, align 8
	%33 = load i64, ptr %n, align 8
	; load constant 16 into %34
	%34 = add i64 16, 0
	%35 = add i64 %33, %34
	%36 = inttoptr i64 %35 to ptr
	%37 = load i64, ptr %36, align 8
	%38 = call i64 @printInt(i64 %37)
	store i64 %38, ptr %1, align 8
	%39 = load i64, ptr %n, align 8
	%40 = inttoptr i64 %39 to ptr
	%41 = load i64, ptr %40, align 8
	%42 = sub i64 %41, 0
	%43 = icmp eq i64 %42, 0
	br i1 %43, label %.L468, label %.L469
.L469:
	%44 = getelementptr i64, ptr @.STR84, i64 0
	%45 = ptrtoint ptr %44 to i64
	%46 = call i64 @print(i64 %45)
	store i64 %46, ptr %1, align 8
	br label %.L467
.L468:
	br label %.L467
.L467:
	%47 = load i64, ptr %n, align 8
	%48 = inttoptr i64 %47 to ptr
	%49 = load i64, ptr %48, align 8
	%50 = getelementptr i64, ptr %n, i64 0
	%51 = ptrtoint ptr %50 to i64
	%52 = inttoptr i64 %51 to ptr
	store i64 %49, ptr %52, align 8
	%53  = add i64 %49, 0; bloody hack
	store i64 %49, ptr %1, align 8
	br label %.L464
.L465:
	%54 = getelementptr i64, ptr @.STR85, i64 0
	%55 = ptrtoint ptr %54 to i64
	%56 = call i64 @println(i64 %55)
	store i64 %56, ptr %1, align 8
	%entryLabel = alloca i64, align 8
	%57 = call i64 @genGetLabel()
	%58 = getelementptr i64, ptr %entryLabel, i64 0
	%59 = ptrtoint ptr %58 to i64
	%60 = inttoptr i64 %59 to ptr
	store i64 %57, ptr %60, align 8
	%61  = add i64 %57, 0; bloody hack
	store i64 %57, ptr %1, align 8
	%62 = load i64, ptr %entryLabel, align 8
	%63 = call i64 @genDefLabel(i64 %62)
	store i64 %63, ptr %1, align 8
	%64 = load i64, ptr @genFnParamList, align 8
	%65 = getelementptr i64, ptr %n, i64 0
	%66 = ptrtoint ptr %65 to i64
	%67 = inttoptr i64 %66 to ptr
	store i64 %64, ptr %67, align 8
	%68  = add i64 %64, 0; bloody hack
	store i64 %64, ptr %1, align 8
	br label %.L470
.L470:
	%69 = load i64, ptr %n, align 8
	%70 = sub i64 %69, 0
	%71 = icmp eq i64 %70, 0
	br i1 %71, label %.L471, label %.L472
.L472:
	; load constant 0 into %72
	%72 = add i64 0, 0
	%73 = load i64, ptr %n, align 8
	; load constant 8 into %74
	%74 = add i64 8, 0
	%75 = add i64 %73, %74
	%76 = inttoptr i64 %75 to ptr
	%77 = load i64, ptr %76, align 8
	%78 = call i64 @symtabAddLocal(i64 %77, i64 %72)
	store i64 %78, ptr %1, align 8
	%79 = getelementptr i64, ptr @.STR86, i64 0
	%80 = ptrtoint ptr %79 to i64
	%81 = call i64 @print(i64 %80)
	store i64 %81, ptr %1, align 8
	%82 = load i64, ptr %n, align 8
	; load constant 8 into %83
	%83 = add i64 8, 0
	%84 = add i64 %82, %83
	%85 = inttoptr i64 %84 to ptr
	%86 = load i64, ptr %85, align 8
	%87 = call i64 @print(i64 %86)
	store i64 %87, ptr %1, align 8
	%88 = getelementptr i64, ptr @.STR87, i64 0
	%89 = ptrtoint ptr %88 to i64
	%90 = call i64 @println(i64 %89)
	store i64 %90, ptr %1, align 8
	%91 = getelementptr i64, ptr @.STR88, i64 0
	%92 = ptrtoint ptr %91 to i64
	%93 = call i64 @print(i64 %92)
	store i64 %93, ptr %1, align 8
	%94 = load i64, ptr %n, align 8
	; load constant 16 into %95
	%95 = add i64 16, 0
	%96 = add i64 %94, %95
	%97 = inttoptr i64 %96 to ptr
	%98 = load i64, ptr %97, align 8
	%99 = call i64 @printInt(i64 %98)
	store i64 %99, ptr %1, align 8
	%100 = getelementptr i64, ptr @.STR89, i64 0
	%101 = ptrtoint ptr %100 to i64
	%102 = call i64 @print(i64 %101)
	store i64 %102, ptr %1, align 8
	%103 = load i64, ptr %n, align 8
	; load constant 8 into %104
	%104 = add i64 8, 0
	%105 = add i64 %103, %104
	%106 = inttoptr i64 %105 to ptr
	%107 = load i64, ptr %106, align 8
	%108 = call i64 @print(i64 %107)
	store i64 %108, ptr %1, align 8
	%109 = getelementptr i64, ptr @.STR90, i64 0
	%110 = ptrtoint ptr %109 to i64
	%111 = call i64 @println(i64 %110)
	store i64 %111, ptr %1, align 8
	%f = alloca i64, align 8
	%112 = load i64, ptr %n, align 8
	%113 = getelementptr i64, ptr %f, i64 0
	%114 = ptrtoint ptr %113 to i64
	%115 = inttoptr i64 %114 to ptr
	store i64 %112, ptr %115, align 8
	%116  = add i64 %112, 0; bloody hack
	store i64 %112, ptr %1, align 8
	%117 = load i64, ptr %n, align 8
	%118 = inttoptr i64 %117 to ptr
	%119 = load i64, ptr %118, align 8
	%120 = getelementptr i64, ptr %n, i64 0
	%121 = ptrtoint ptr %120 to i64
	%122 = inttoptr i64 %121 to ptr
	store i64 %119, ptr %122, align 8
	%123  = add i64 %119, 0; bloody hack
	store i64 %119, ptr %1, align 8
	%124 = load i64, ptr %f, align 8
	%125 = call i64 @free(i64 %124)
	store i64 %125, ptr %1, align 8
	br label %.L470
.L471:
	; load constant 0 into %126
	%126 = add i64 0, 0
	%127 = getelementptr i64, ptr @genFnParamList, i64 0
	%128 = ptrtoint ptr %127 to i64
	%129 = inttoptr i64 %128 to ptr
	store i64 %126, ptr %129, align 8
	%130  = add i64 %126, 0; bloody hack
	store i64 %126, ptr %1, align 8
	%131 = call i64 @genGetReg()
	%132 = load i64, ptr @genFunctionBuildingInfo, align 8
	; load constant 16 into %133
	%133 = add i64 16, 0
	%134 = add i64 %132, %133
	%135 = inttoptr i64 %134 to ptr
	store i64 %131, ptr %135, align 8
	%136  = add i64 %131, 0; bloody hack
	store i64 %131, ptr %1, align 8
	%137 = getelementptr i64, ptr @.STR91, i64 0
	%138 = ptrtoint ptr %137 to i64
	%139 = call i64 @print(i64 %138)
	store i64 %139, ptr %1, align 8
	%140 = load i64, ptr @genFunctionBuildingInfo, align 8
	; load constant 16 into %141
	%141 = add i64 16, 0
	%142 = add i64 %140, %141
	%143 = inttoptr i64 %142 to ptr
	%144 = load i64, ptr %143, align 8
	%145 = call i64 @printInt(i64 %144)
	store i64 %145, ptr %1, align 8
	%146 = getelementptr i64, ptr @.STR92, i64 0
	%147 = ptrtoint ptr %146 to i64
	%148 = call i64 @println(i64 %147)
	store i64 %148, ptr %1, align 8
	%149 = load i64, ptr %name, align 8
	%150 = load i64, ptr @genFunctionBuildingInfo, align 8
	%151 = inttoptr i64 %150 to ptr
	store i64 %149, ptr %151, align 8
	%152  = add i64 %149, 0; bloody hack
	store i64 %149, ptr %1, align 8
	br label %.L473
.L473:
	%153= load i64, ptr %1, align 8
	ret i64 %153
}

@.STR92 = global [40 x i8] c" = alloca i64, align 8 ; ptr to ret val\00", align 8
@.STR91 = global [3 x i8] c"	%\00", align 8
@.STR90 = global [10 x i8] c", align 8\00", align 8
@.STR89 = global [8 x i8] c", ptr %\00", align 8
@.STR88 = global [13 x i8] c"	store i64 %\00", align 8
@.STR87 = global [23 x i8] c" = alloca i64, align 8\00", align 8
@.STR86 = global [3 x i8] c"	%\00", align 8
@.STR85 = global [4 x i8] c") {\00", align 8
@.STR84 = global [3 x i8] c", \00", align 8
@.STR83 = global [6 x i8] c"i64 %\00", align 8
@.STR82 = global [2 x i8] c"(\00", align 8
@.STR81 = global [13 x i8] c"define i64 @\00", align 8
@.STR80 = global [12 x i8] c"; function \00", align 8
; function genFuncDefEnd
define i64 @genFuncDefEnd() {
.L474:
	%0 = alloca i64, align 8 ; ptr to ret val
	%dest = alloca i64, align 8
	%1 = call i64 @genGetReg()
	%2 = getelementptr i64, ptr %dest, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = inttoptr i64 %3 to ptr
	store i64 %1, ptr %4, align 8
	%5  = add i64 %1, 0; bloody hack
	store i64 %1, ptr %0, align 8
	%leaveLabel = alloca i64, align 8
	%6 = call i64 @genGetLabel()
	%7 = getelementptr i64, ptr %leaveLabel, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = inttoptr i64 %8 to ptr
	store i64 %6, ptr %9, align 8
	%10  = add i64 %6, 0; bloody hack
	store i64 %6, ptr %0, align 8
	%11 = load i64, ptr %leaveLabel, align 8
	%12 = call i64 @genDefLabel(i64 %11)
	store i64 %12, ptr %0, align 8
	%13 = getelementptr i64, ptr @.STR93, i64 0
	%14 = ptrtoint ptr %13 to i64
	%15 = call i64 @print(i64 %14)
	store i64 %15, ptr %0, align 8
	%16 = load i64, ptr %dest, align 8
	%17 = call i64 @printInt(i64 %16)
	store i64 %17, ptr %0, align 8
	%18 = getelementptr i64, ptr @.STR94, i64 0
	%19 = ptrtoint ptr %18 to i64
	%20 = call i64 @print(i64 %19)
	store i64 %20, ptr %0, align 8
	%21 = load i64, ptr @genFunctionBuildingInfo, align 8
	; load constant 16 into %22
	%22 = add i64 16, 0
	%23 = add i64 %21, %22
	%24 = inttoptr i64 %23 to ptr
	%25 = load i64, ptr %24, align 8
	%26 = call i64 @printInt(i64 %25)
	store i64 %26, ptr %0, align 8
	%27 = getelementptr i64, ptr @.STR95, i64 0
	%28 = ptrtoint ptr %27 to i64
	%29 = call i64 @println(i64 %28)
	store i64 %29, ptr %0, align 8
	%30 = getelementptr i64, ptr @.STR96, i64 0
	%31 = ptrtoint ptr %30 to i64
	%32 = call i64 @print(i64 %31)
	store i64 %32, ptr %0, align 8
	%33 = load i64, ptr %dest, align 8
	%34 = call i64 @printInt(i64 %33)
	store i64 %34, ptr %0, align 8
	; load constant 0 into %35
	%35 = add i64 0, 0
	%36 = call i64 @println(i64 %35)
	store i64 %36, ptr %0, align 8
	%37 = getelementptr i64, ptr @.STR97, i64 0
	%38 = ptrtoint ptr %37 to i64
	%39 = call i64 @println(i64 %38)
	store i64 %39, ptr %0, align 8
	; load constant 0 into %40
	%40 = add i64 0, 0
	%41 = call i64 @println(i64 %40)
	store i64 %41, ptr %0, align 8
	; load constant 0 into %42
	%42 = add i64 0, 0
	%43 = load i64, ptr @genFunctionBuildingInfo, align 8
	%44 = inttoptr i64 %43 to ptr
	store i64 %42, ptr %44, align 8
	%45  = add i64 %42, 0; bloody hack
	store i64 %42, ptr %0, align 8
	%46 = call i64 @genPrintStringList()
	store i64 %46, ptr %0, align 8
	br label %.L475
.L475:
	%47= load i64, ptr %0, align 8
	ret i64 %47
}

@.STR97 = global [2 x i8] c"}\00", align 8
@.STR96 = global [11 x i8] c"	ret i64 %\00", align 8
@.STR95 = global [10 x i8] c", align 8\00", align 8
@.STR94 = global [18 x i8] c"= load i64, ptr %\00", align 8
@.STR93 = global [3 x i8] c"	%\00", align 8
; function genInstr
define i64 @genInstr(i64 %0, i64 %1, i64 %2) {
.L476:
	%instr = alloca i64, align 8
	store i64 %0, ptr %instr, align 8
	%left = alloca i64, align 8
	store i64 %1, ptr %left, align 8
	%right = alloca i64, align 8
	store i64 %2, ptr %right, align 8
	%3 = alloca i64, align 8 ; ptr to ret val
	%dest = alloca i64, align 8
	%4 = call i64 @genGetReg()
	%5 = getelementptr i64, ptr %dest, i64 0
	%6 = ptrtoint ptr %5 to i64
	%7 = inttoptr i64 %6 to ptr
	store i64 %4, ptr %7, align 8
	%8  = add i64 %4, 0; bloody hack
	store i64 %4, ptr %3, align 8
	%9 = load i64, ptr %instr, align 8
	; load constant 0 into %10
	%10 = add i64 0, 0
	%11 = icmp eq i64 %9, %10
	%12 = zext i1 %11 to i64
	%13 = sub i64 %12, 0
	%14 = icmp eq i64 %13, 0
	br i1 %14, label %.L478, label %.L479
.L479:
	%15 = getelementptr i64, ptr @.STR98, i64 0
	%16 = ptrtoint ptr %15 to i64
	%17 = call i64 @print(i64 %16)
	store i64 %17, ptr %3, align 8
	%18 = load i64, ptr %dest, align 8
	%19 = call i64 @printInt(i64 %18)
	store i64 %19, ptr %3, align 8
	%20 = getelementptr i64, ptr @.STR99, i64 0
	%21 = ptrtoint ptr %20 to i64
	%22 = call i64 @print(i64 %21)
	store i64 %22, ptr %3, align 8
	%23 = getelementptr i64, ptr @.STR100, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = call i64 @print(i64 %24)
	store i64 %25, ptr %3, align 8
	%26 = load i64, ptr %right, align 8
	%27 = call i64 @printInt(i64 %26)
	store i64 %27, ptr %3, align 8
	%28 = getelementptr i64, ptr @.STR101, i64 0
	%29 = ptrtoint ptr %28 to i64
	%30 = call i64 @print(i64 %29)
	store i64 %30, ptr %3, align 8
	%31 = load i64, ptr %left, align 8
	%32 = call i64 @printInt(i64 %31)
	store i64 %32, ptr %3, align 8
	; load constant 0 into %33
	%33 = add i64 0, 0
	%34 = call i64 @println(i64 %33)
	store i64 %34, ptr %3, align 8
	br label %.L477
.L478:
	%35 = load i64, ptr %instr, align 8
	; load constant 1 into %36
	%36 = add i64 1, 0
	%37 = icmp eq i64 %35, %36
	%38 = zext i1 %37 to i64
	%39 = sub i64 %38, 0
	%40 = icmp eq i64 %39, 0
	br i1 %40, label %.L481, label %.L482
.L482:
	%41 = getelementptr i64, ptr @.STR102, i64 0
	%42 = ptrtoint ptr %41 to i64
	%43 = call i64 @print(i64 %42)
	store i64 %43, ptr %3, align 8
	%44 = load i64, ptr %dest, align 8
	%45 = call i64 @printInt(i64 %44)
	store i64 %45, ptr %3, align 8
	%46 = getelementptr i64, ptr @.STR103, i64 0
	%47 = ptrtoint ptr %46 to i64
	%48 = call i64 @print(i64 %47)
	store i64 %48, ptr %3, align 8
	%49 = getelementptr i64, ptr @.STR104, i64 0
	%50 = ptrtoint ptr %49 to i64
	%51 = call i64 @print(i64 %50)
	store i64 %51, ptr %3, align 8
	%52 = load i64, ptr %right, align 8
	%53 = call i64 @printInt(i64 %52)
	store i64 %53, ptr %3, align 8
	%54 = getelementptr i64, ptr @.STR105, i64 0
	%55 = ptrtoint ptr %54 to i64
	%56 = call i64 @print(i64 %55)
	store i64 %56, ptr %3, align 8
	%57 = load i64, ptr %left, align 8
	%58 = call i64 @printInt(i64 %57)
	store i64 %58, ptr %3, align 8
	; load constant 0 into %59
	%59 = add i64 0, 0
	%60 = call i64 @println(i64 %59)
	store i64 %60, ptr %3, align 8
	br label %.L480
.L481:
	%61 = load i64, ptr %instr, align 8
	; load constant 2 into %62
	%62 = add i64 2, 0
	%63 = icmp eq i64 %61, %62
	%64 = zext i1 %63 to i64
	%65 = sub i64 %64, 0
	%66 = icmp eq i64 %65, 0
	br i1 %66, label %.L484, label %.L485
.L485:
	%67 = getelementptr i64, ptr @.STR106, i64 0
	%68 = ptrtoint ptr %67 to i64
	%69 = call i64 @print(i64 %68)
	store i64 %69, ptr %3, align 8
	%70 = load i64, ptr %dest, align 8
	%71 = call i64 @printInt(i64 %70)
	store i64 %71, ptr %3, align 8
	%72 = getelementptr i64, ptr @.STR107, i64 0
	%73 = ptrtoint ptr %72 to i64
	%74 = call i64 @print(i64 %73)
	store i64 %74, ptr %3, align 8
	%75 = getelementptr i64, ptr @.STR108, i64 0
	%76 = ptrtoint ptr %75 to i64
	%77 = call i64 @print(i64 %76)
	store i64 %77, ptr %3, align 8
	%78 = load i64, ptr %right, align 8
	%79 = call i64 @printInt(i64 %78)
	store i64 %79, ptr %3, align 8
	%80 = getelementptr i64, ptr @.STR109, i64 0
	%81 = ptrtoint ptr %80 to i64
	%82 = call i64 @print(i64 %81)
	store i64 %82, ptr %3, align 8
	%83 = load i64, ptr %left, align 8
	%84 = call i64 @printInt(i64 %83)
	store i64 %84, ptr %3, align 8
	; load constant 0 into %85
	%85 = add i64 0, 0
	%86 = call i64 @println(i64 %85)
	store i64 %86, ptr %3, align 8
	br label %.L483
.L484:
	%87 = load i64, ptr %instr, align 8
	; load constant 3 into %88
	%88 = add i64 3, 0
	%89 = icmp eq i64 %87, %88
	%90 = zext i1 %89 to i64
	%91 = sub i64 %90, 0
	%92 = icmp eq i64 %91, 0
	br i1 %92, label %.L487, label %.L488
.L488:
	%93 = getelementptr i64, ptr @.STR110, i64 0
	%94 = ptrtoint ptr %93 to i64
	%95 = call i64 @print(i64 %94)
	store i64 %95, ptr %3, align 8
	%96 = load i64, ptr %dest, align 8
	%97 = call i64 @printInt(i64 %96)
	store i64 %97, ptr %3, align 8
	%98 = getelementptr i64, ptr @.STR111, i64 0
	%99 = ptrtoint ptr %98 to i64
	%100 = call i64 @print(i64 %99)
	store i64 %100, ptr %3, align 8
	%101 = getelementptr i64, ptr @.STR112, i64 0
	%102 = ptrtoint ptr %101 to i64
	%103 = call i64 @print(i64 %102)
	store i64 %103, ptr %3, align 8
	%104 = load i64, ptr %right, align 8
	%105 = call i64 @printInt(i64 %104)
	store i64 %105, ptr %3, align 8
	%106 = getelementptr i64, ptr @.STR113, i64 0
	%107 = ptrtoint ptr %106 to i64
	%108 = call i64 @print(i64 %107)
	store i64 %108, ptr %3, align 8
	%109 = load i64, ptr %left, align 8
	%110 = call i64 @printInt(i64 %109)
	store i64 %110, ptr %3, align 8
	; load constant 0 into %111
	%111 = add i64 0, 0
	%112 = call i64 @println(i64 %111)
	store i64 %112, ptr %3, align 8
	br label %.L486
.L487:
	%113 = load i64, ptr %instr, align 8
	; load constant 4 into %114
	%114 = add i64 4, 0
	%115 = icmp eq i64 %113, %114
	%116 = zext i1 %115 to i64
	%117 = sub i64 %116, 0
	%118 = icmp eq i64 %117, 0
	br i1 %118, label %.L490, label %.L491
.L491:
	%119 = getelementptr i64, ptr @.STR114, i64 0
	%120 = ptrtoint ptr %119 to i64
	%121 = call i64 @print(i64 %120)
	store i64 %121, ptr %3, align 8
	%122 = load i64, ptr %dest, align 8
	%123 = call i64 @printInt(i64 %122)
	store i64 %123, ptr %3, align 8
	%124 = getelementptr i64, ptr @.STR115, i64 0
	%125 = ptrtoint ptr %124 to i64
	%126 = call i64 @print(i64 %125)
	store i64 %126, ptr %3, align 8
	%127 = getelementptr i64, ptr @.STR116, i64 0
	%128 = ptrtoint ptr %127 to i64
	%129 = call i64 @print(i64 %128)
	store i64 %129, ptr %3, align 8
	%130 = load i64, ptr %right, align 8
	%131 = call i64 @printInt(i64 %130)
	store i64 %131, ptr %3, align 8
	%132 = getelementptr i64, ptr @.STR117, i64 0
	%133 = ptrtoint ptr %132 to i64
	%134 = call i64 @print(i64 %133)
	store i64 %134, ptr %3, align 8
	%135 = load i64, ptr %left, align 8
	%136 = call i64 @printInt(i64 %135)
	store i64 %136, ptr %3, align 8
	; load constant 0 into %137
	%137 = add i64 0, 0
	%138 = call i64 @println(i64 %137)
	store i64 %138, ptr %3, align 8
	br label %.L489
.L490:
	%139 = load i64, ptr %instr, align 8
	; load constant 5 into %140
	%140 = add i64 5, 0
	%141 = icmp eq i64 %139, %140
	%142 = zext i1 %141 to i64
	%143 = sub i64 %142, 0
	%144 = icmp eq i64 %143, 0
	br i1 %144, label %.L493, label %.L494
.L494:
	%145 = getelementptr i64, ptr @.STR118, i64 0
	%146 = ptrtoint ptr %145 to i64
	%147 = call i64 @print(i64 %146)
	store i64 %147, ptr %3, align 8
	%148 = load i64, ptr %dest, align 8
	%149 = call i64 @printInt(i64 %148)
	store i64 %149, ptr %3, align 8
	%150 = getelementptr i64, ptr @.STR119, i64 0
	%151 = ptrtoint ptr %150 to i64
	%152 = call i64 @print(i64 %151)
	store i64 %152, ptr %3, align 8
	%153 = getelementptr i64, ptr @.STR120, i64 0
	%154 = ptrtoint ptr %153 to i64
	%155 = call i64 @print(i64 %154)
	store i64 %155, ptr %3, align 8
	%156 = load i64, ptr %right, align 8
	%157 = call i64 @printInt(i64 %156)
	store i64 %157, ptr %3, align 8
	%158 = getelementptr i64, ptr @.STR121, i64 0
	%159 = ptrtoint ptr %158 to i64
	%160 = call i64 @print(i64 %159)
	store i64 %160, ptr %3, align 8
	%161 = load i64, ptr %left, align 8
	%162 = call i64 @printInt(i64 %161)
	store i64 %162, ptr %3, align 8
	; load constant 0 into %163
	%163 = add i64 0, 0
	%164 = call i64 @println(i64 %163)
	store i64 %164, ptr %3, align 8
	%165 = load i64, ptr %dest, align 8
	%166 = getelementptr i64, ptr %left, i64 0
	%167 = ptrtoint ptr %166 to i64
	%168 = inttoptr i64 %167 to ptr
	store i64 %165, ptr %168, align 8
	%169  = add i64 %165, 0; bloody hack
	store i64 %165, ptr %3, align 8
	%170 = call i64 @genGetReg()
	%171 = getelementptr i64, ptr %dest, i64 0
	%172 = ptrtoint ptr %171 to i64
	%173 = inttoptr i64 %172 to ptr
	store i64 %170, ptr %173, align 8
	%174  = add i64 %170, 0; bloody hack
	store i64 %170, ptr %3, align 8
	%175 = getelementptr i64, ptr @.STR122, i64 0
	%176 = ptrtoint ptr %175 to i64
	%177 = call i64 @print(i64 %176)
	store i64 %177, ptr %3, align 8
	%178 = load i64, ptr %dest, align 8
	%179 = call i64 @printInt(i64 %178)
	store i64 %179, ptr %3, align 8
	%180 = getelementptr i64, ptr @.STR123, i64 0
	%181 = ptrtoint ptr %180 to i64
	%182 = call i64 @print(i64 %181)
	store i64 %182, ptr %3, align 8
	%183 = load i64, ptr %left, align 8
	%184 = call i64 @printInt(i64 %183)
	store i64 %184, ptr %3, align 8
	%185 = getelementptr i64, ptr @.STR124, i64 0
	%186 = ptrtoint ptr %185 to i64
	%187 = call i64 @println(i64 %186)
	store i64 %187, ptr %3, align 8
	br label %.L492
.L493:
	%188 = load i64, ptr %instr, align 8
	; load constant 6 into %189
	%189 = add i64 6, 0
	%190 = icmp eq i64 %188, %189
	%191 = zext i1 %190 to i64
	%192 = sub i64 %191, 0
	%193 = icmp eq i64 %192, 0
	br i1 %193, label %.L496, label %.L497
.L497:
	%194 = getelementptr i64, ptr @.STR125, i64 0
	%195 = ptrtoint ptr %194 to i64
	%196 = call i64 @print(i64 %195)
	store i64 %196, ptr %3, align 8
	%197 = load i64, ptr %dest, align 8
	%198 = call i64 @printInt(i64 %197)
	store i64 %198, ptr %3, align 8
	%199 = getelementptr i64, ptr @.STR126, i64 0
	%200 = ptrtoint ptr %199 to i64
	%201 = call i64 @print(i64 %200)
	store i64 %201, ptr %3, align 8
	%202 = getelementptr i64, ptr @.STR127, i64 0
	%203 = ptrtoint ptr %202 to i64
	%204 = call i64 @print(i64 %203)
	store i64 %204, ptr %3, align 8
	%205 = load i64, ptr %right, align 8
	%206 = call i64 @printInt(i64 %205)
	store i64 %206, ptr %3, align 8
	%207 = getelementptr i64, ptr @.STR128, i64 0
	%208 = ptrtoint ptr %207 to i64
	%209 = call i64 @print(i64 %208)
	store i64 %209, ptr %3, align 8
	%210 = load i64, ptr %left, align 8
	%211 = call i64 @printInt(i64 %210)
	store i64 %211, ptr %3, align 8
	; load constant 0 into %212
	%212 = add i64 0, 0
	%213 = call i64 @println(i64 %212)
	store i64 %213, ptr %3, align 8
	%214 = load i64, ptr %dest, align 8
	%215 = getelementptr i64, ptr %left, i64 0
	%216 = ptrtoint ptr %215 to i64
	%217 = inttoptr i64 %216 to ptr
	store i64 %214, ptr %217, align 8
	%218  = add i64 %214, 0; bloody hack
	store i64 %214, ptr %3, align 8
	%219 = call i64 @genGetReg()
	%220 = getelementptr i64, ptr %dest, i64 0
	%221 = ptrtoint ptr %220 to i64
	%222 = inttoptr i64 %221 to ptr
	store i64 %219, ptr %222, align 8
	%223  = add i64 %219, 0; bloody hack
	store i64 %219, ptr %3, align 8
	%224 = getelementptr i64, ptr @.STR129, i64 0
	%225 = ptrtoint ptr %224 to i64
	%226 = call i64 @print(i64 %225)
	store i64 %226, ptr %3, align 8
	%227 = load i64, ptr %dest, align 8
	%228 = call i64 @printInt(i64 %227)
	store i64 %228, ptr %3, align 8
	%229 = getelementptr i64, ptr @.STR130, i64 0
	%230 = ptrtoint ptr %229 to i64
	%231 = call i64 @print(i64 %230)
	store i64 %231, ptr %3, align 8
	%232 = load i64, ptr %left, align 8
	%233 = call i64 @printInt(i64 %232)
	store i64 %233, ptr %3, align 8
	%234 = getelementptr i64, ptr @.STR131, i64 0
	%235 = ptrtoint ptr %234 to i64
	%236 = call i64 @println(i64 %235)
	store i64 %236, ptr %3, align 8
	br label %.L495
.L496:
	%237 = load i64, ptr %instr, align 8
	; load constant 7 into %238
	%238 = add i64 7, 0
	%239 = icmp eq i64 %237, %238
	%240 = zext i1 %239 to i64
	%241 = sub i64 %240, 0
	%242 = icmp eq i64 %241, 0
	br i1 %242, label %.L499, label %.L500
.L500:
	%243 = getelementptr i64, ptr @.STR132, i64 0
	%244 = ptrtoint ptr %243 to i64
	%245 = call i64 @print(i64 %244)
	store i64 %245, ptr %3, align 8
	%246 = load i64, ptr %dest, align 8
	%247 = call i64 @printInt(i64 %246)
	store i64 %247, ptr %3, align 8
	%248 = getelementptr i64, ptr @.STR133, i64 0
	%249 = ptrtoint ptr %248 to i64
	%250 = call i64 @print(i64 %249)
	store i64 %250, ptr %3, align 8
	%251 = getelementptr i64, ptr @.STR134, i64 0
	%252 = ptrtoint ptr %251 to i64
	%253 = call i64 @print(i64 %252)
	store i64 %253, ptr %3, align 8
	%254 = load i64, ptr %right, align 8
	%255 = call i64 @printInt(i64 %254)
	store i64 %255, ptr %3, align 8
	%256 = getelementptr i64, ptr @.STR135, i64 0
	%257 = ptrtoint ptr %256 to i64
	%258 = call i64 @print(i64 %257)
	store i64 %258, ptr %3, align 8
	%259 = load i64, ptr %left, align 8
	%260 = call i64 @printInt(i64 %259)
	store i64 %260, ptr %3, align 8
	; load constant 0 into %261
	%261 = add i64 0, 0
	%262 = call i64 @println(i64 %261)
	store i64 %262, ptr %3, align 8
	%263 = load i64, ptr %dest, align 8
	%264 = getelementptr i64, ptr %left, i64 0
	%265 = ptrtoint ptr %264 to i64
	%266 = inttoptr i64 %265 to ptr
	store i64 %263, ptr %266, align 8
	%267  = add i64 %263, 0; bloody hack
	store i64 %263, ptr %3, align 8
	%268 = call i64 @genGetReg()
	%269 = getelementptr i64, ptr %dest, i64 0
	%270 = ptrtoint ptr %269 to i64
	%271 = inttoptr i64 %270 to ptr
	store i64 %268, ptr %271, align 8
	%272  = add i64 %268, 0; bloody hack
	store i64 %268, ptr %3, align 8
	%273 = getelementptr i64, ptr @.STR136, i64 0
	%274 = ptrtoint ptr %273 to i64
	%275 = call i64 @print(i64 %274)
	store i64 %275, ptr %3, align 8
	%276 = load i64, ptr %dest, align 8
	%277 = call i64 @printInt(i64 %276)
	store i64 %277, ptr %3, align 8
	%278 = getelementptr i64, ptr @.STR137, i64 0
	%279 = ptrtoint ptr %278 to i64
	%280 = call i64 @print(i64 %279)
	store i64 %280, ptr %3, align 8
	%281 = load i64, ptr %left, align 8
	%282 = call i64 @printInt(i64 %281)
	store i64 %282, ptr %3, align 8
	%283 = getelementptr i64, ptr @.STR138, i64 0
	%284 = ptrtoint ptr %283 to i64
	%285 = call i64 @println(i64 %284)
	store i64 %285, ptr %3, align 8
	br label %.L498
.L499:
	%286 = load i64, ptr %instr, align 8
	; load constant 8 into %287
	%287 = add i64 8, 0
	%288 = icmp eq i64 %286, %287
	%289 = zext i1 %288 to i64
	%290 = sub i64 %289, 0
	%291 = icmp eq i64 %290, 0
	br i1 %291, label %.L502, label %.L503
.L503:
	%292 = getelementptr i64, ptr @.STR139, i64 0
	%293 = ptrtoint ptr %292 to i64
	%294 = call i64 @print(i64 %293)
	store i64 %294, ptr %3, align 8
	%295 = load i64, ptr %dest, align 8
	%296 = call i64 @printInt(i64 %295)
	store i64 %296, ptr %3, align 8
	%297 = getelementptr i64, ptr @.STR140, i64 0
	%298 = ptrtoint ptr %297 to i64
	%299 = call i64 @print(i64 %298)
	store i64 %299, ptr %3, align 8
	%300 = getelementptr i64, ptr @.STR141, i64 0
	%301 = ptrtoint ptr %300 to i64
	%302 = call i64 @print(i64 %301)
	store i64 %302, ptr %3, align 8
	%303 = load i64, ptr %right, align 8
	%304 = call i64 @printInt(i64 %303)
	store i64 %304, ptr %3, align 8
	%305 = getelementptr i64, ptr @.STR142, i64 0
	%306 = ptrtoint ptr %305 to i64
	%307 = call i64 @print(i64 %306)
	store i64 %307, ptr %3, align 8
	%308 = load i64, ptr %left, align 8
	%309 = call i64 @printInt(i64 %308)
	store i64 %309, ptr %3, align 8
	; load constant 0 into %310
	%310 = add i64 0, 0
	%311 = call i64 @println(i64 %310)
	store i64 %311, ptr %3, align 8
	%312 = load i64, ptr %dest, align 8
	%313 = getelementptr i64, ptr %left, i64 0
	%314 = ptrtoint ptr %313 to i64
	%315 = inttoptr i64 %314 to ptr
	store i64 %312, ptr %315, align 8
	%316  = add i64 %312, 0; bloody hack
	store i64 %312, ptr %3, align 8
	%317 = call i64 @genGetReg()
	%318 = getelementptr i64, ptr %dest, i64 0
	%319 = ptrtoint ptr %318 to i64
	%320 = inttoptr i64 %319 to ptr
	store i64 %317, ptr %320, align 8
	%321  = add i64 %317, 0; bloody hack
	store i64 %317, ptr %3, align 8
	%322 = getelementptr i64, ptr @.STR143, i64 0
	%323 = ptrtoint ptr %322 to i64
	%324 = call i64 @print(i64 %323)
	store i64 %324, ptr %3, align 8
	%325 = load i64, ptr %dest, align 8
	%326 = call i64 @printInt(i64 %325)
	store i64 %326, ptr %3, align 8
	%327 = getelementptr i64, ptr @.STR144, i64 0
	%328 = ptrtoint ptr %327 to i64
	%329 = call i64 @print(i64 %328)
	store i64 %329, ptr %3, align 8
	%330 = load i64, ptr %left, align 8
	%331 = call i64 @printInt(i64 %330)
	store i64 %331, ptr %3, align 8
	%332 = getelementptr i64, ptr @.STR145, i64 0
	%333 = ptrtoint ptr %332 to i64
	%334 = call i64 @println(i64 %333)
	store i64 %334, ptr %3, align 8
	br label %.L501
.L502:
	%335 = load i64, ptr %instr, align 8
	; load constant 9 into %336
	%336 = add i64 9, 0
	%337 = icmp eq i64 %335, %336
	%338 = zext i1 %337 to i64
	%339 = sub i64 %338, 0
	%340 = icmp eq i64 %339, 0
	br i1 %340, label %.L505, label %.L506
.L506:
	%341 = getelementptr i64, ptr @.STR146, i64 0
	%342 = ptrtoint ptr %341 to i64
	%343 = call i64 @print(i64 %342)
	store i64 %343, ptr %3, align 8
	%344 = load i64, ptr %dest, align 8
	%345 = call i64 @printInt(i64 %344)
	store i64 %345, ptr %3, align 8
	%346 = getelementptr i64, ptr @.STR147, i64 0
	%347 = ptrtoint ptr %346 to i64
	%348 = call i64 @print(i64 %347)
	store i64 %348, ptr %3, align 8
	%349 = getelementptr i64, ptr @.STR148, i64 0
	%350 = ptrtoint ptr %349 to i64
	%351 = call i64 @print(i64 %350)
	store i64 %351, ptr %3, align 8
	%352 = load i64, ptr %right, align 8
	%353 = call i64 @printInt(i64 %352)
	store i64 %353, ptr %3, align 8
	%354 = getelementptr i64, ptr @.STR149, i64 0
	%355 = ptrtoint ptr %354 to i64
	%356 = call i64 @print(i64 %355)
	store i64 %356, ptr %3, align 8
	%357 = load i64, ptr %left, align 8
	%358 = call i64 @printInt(i64 %357)
	store i64 %358, ptr %3, align 8
	; load constant 0 into %359
	%359 = add i64 0, 0
	%360 = call i64 @println(i64 %359)
	store i64 %360, ptr %3, align 8
	%361 = load i64, ptr %dest, align 8
	%362 = getelementptr i64, ptr %left, i64 0
	%363 = ptrtoint ptr %362 to i64
	%364 = inttoptr i64 %363 to ptr
	store i64 %361, ptr %364, align 8
	%365  = add i64 %361, 0; bloody hack
	store i64 %361, ptr %3, align 8
	%366 = call i64 @genGetReg()
	%367 = getelementptr i64, ptr %dest, i64 0
	%368 = ptrtoint ptr %367 to i64
	%369 = inttoptr i64 %368 to ptr
	store i64 %366, ptr %369, align 8
	%370  = add i64 %366, 0; bloody hack
	store i64 %366, ptr %3, align 8
	%371 = getelementptr i64, ptr @.STR150, i64 0
	%372 = ptrtoint ptr %371 to i64
	%373 = call i64 @print(i64 %372)
	store i64 %373, ptr %3, align 8
	%374 = load i64, ptr %dest, align 8
	%375 = call i64 @printInt(i64 %374)
	store i64 %375, ptr %3, align 8
	%376 = getelementptr i64, ptr @.STR151, i64 0
	%377 = ptrtoint ptr %376 to i64
	%378 = call i64 @print(i64 %377)
	store i64 %378, ptr %3, align 8
	%379 = load i64, ptr %left, align 8
	%380 = call i64 @printInt(i64 %379)
	store i64 %380, ptr %3, align 8
	%381 = getelementptr i64, ptr @.STR152, i64 0
	%382 = ptrtoint ptr %381 to i64
	%383 = call i64 @println(i64 %382)
	store i64 %383, ptr %3, align 8
	br label %.L504
.L505:
	%384 = load i64, ptr %instr, align 8
	; load constant 10 into %385
	%385 = add i64 10, 0
	%386 = icmp eq i64 %384, %385
	%387 = zext i1 %386 to i64
	%388 = sub i64 %387, 0
	%389 = icmp eq i64 %388, 0
	br i1 %389, label %.L508, label %.L509
.L509:
	%390 = getelementptr i64, ptr @.STR153, i64 0
	%391 = ptrtoint ptr %390 to i64
	%392 = call i64 @print(i64 %391)
	store i64 %392, ptr %3, align 8
	%393 = load i64, ptr %dest, align 8
	%394 = call i64 @printInt(i64 %393)
	store i64 %394, ptr %3, align 8
	%395 = getelementptr i64, ptr @.STR154, i64 0
	%396 = ptrtoint ptr %395 to i64
	%397 = call i64 @print(i64 %396)
	store i64 %397, ptr %3, align 8
	%398 = getelementptr i64, ptr @.STR155, i64 0
	%399 = ptrtoint ptr %398 to i64
	%400 = call i64 @print(i64 %399)
	store i64 %400, ptr %3, align 8
	%401 = load i64, ptr %right, align 8
	%402 = call i64 @printInt(i64 %401)
	store i64 %402, ptr %3, align 8
	%403 = getelementptr i64, ptr @.STR156, i64 0
	%404 = ptrtoint ptr %403 to i64
	%405 = call i64 @print(i64 %404)
	store i64 %405, ptr %3, align 8
	%406 = load i64, ptr %left, align 8
	%407 = call i64 @printInt(i64 %406)
	store i64 %407, ptr %3, align 8
	; load constant 0 into %408
	%408 = add i64 0, 0
	%409 = call i64 @println(i64 %408)
	store i64 %409, ptr %3, align 8
	%410 = load i64, ptr %dest, align 8
	%411 = getelementptr i64, ptr %left, i64 0
	%412 = ptrtoint ptr %411 to i64
	%413 = inttoptr i64 %412 to ptr
	store i64 %410, ptr %413, align 8
	%414  = add i64 %410, 0; bloody hack
	store i64 %410, ptr %3, align 8
	%415 = call i64 @genGetReg()
	%416 = getelementptr i64, ptr %dest, i64 0
	%417 = ptrtoint ptr %416 to i64
	%418 = inttoptr i64 %417 to ptr
	store i64 %415, ptr %418, align 8
	%419  = add i64 %415, 0; bloody hack
	store i64 %415, ptr %3, align 8
	%420 = getelementptr i64, ptr @.STR157, i64 0
	%421 = ptrtoint ptr %420 to i64
	%422 = call i64 @print(i64 %421)
	store i64 %422, ptr %3, align 8
	%423 = load i64, ptr %dest, align 8
	%424 = call i64 @printInt(i64 %423)
	store i64 %424, ptr %3, align 8
	%425 = getelementptr i64, ptr @.STR158, i64 0
	%426 = ptrtoint ptr %425 to i64
	%427 = call i64 @print(i64 %426)
	store i64 %427, ptr %3, align 8
	%428 = load i64, ptr %left, align 8
	%429 = call i64 @printInt(i64 %428)
	store i64 %429, ptr %3, align 8
	%430 = getelementptr i64, ptr @.STR159, i64 0
	%431 = ptrtoint ptr %430 to i64
	%432 = call i64 @println(i64 %431)
	store i64 %432, ptr %3, align 8
	br label %.L507
.L508:
	%433 = getelementptr i64, ptr @.STR160, i64 0
	%434 = ptrtoint ptr %433 to i64
	%435 = call i64 @println(i64 %434)
	store i64 %435, ptr %3, align 8
	br label %.L507
.L507:
	br label %.L504
.L504:
	br label %.L501
.L501:
	br label %.L498
.L498:
	br label %.L495
.L495:
	br label %.L492
.L492:
	br label %.L489
.L489:
	br label %.L486
.L486:
	br label %.L483
.L483:
	br label %.L480
.L480:
	br label %.L477
.L477:
	%436 = load i64, ptr %dest, align 8
	store i64 %436, ptr %3, align 8
	br label %.L510
.L510:
	%437= load i64, ptr %3, align 8
	ret i64 %437
}

@.STR160 = global [24 x i8] c"genInstr: unknown instr\00", align 8
@.STR159 = global [8 x i8] c" to i64\00", align 8
@.STR158 = global [13 x i8] c" = zext i1 %\00", align 8
@.STR157 = global [3 x i8] c"	%\00", align 8
@.STR156 = global [4 x i8] c", %\00", align 8
@.STR155 = global [7 x i8] c" i64 %\00", align 8
@.STR154 = global [12 x i8] c" = icmp sgt\00", align 8
@.STR153 = global [3 x i8] c"	%\00", align 8
@.STR152 = global [8 x i8] c" to i64\00", align 8
@.STR151 = global [13 x i8] c" = zext i1 %\00", align 8
@.STR150 = global [3 x i8] c"	%\00", align 8
@.STR149 = global [4 x i8] c", %\00", align 8
@.STR148 = global [7 x i8] c" i64 %\00", align 8
@.STR147 = global [12 x i8] c" = icmp sge\00", align 8
@.STR146 = global [3 x i8] c"	%\00", align 8
@.STR145 = global [8 x i8] c" to i64\00", align 8
@.STR144 = global [13 x i8] c" = zext i1 %\00", align 8
@.STR143 = global [3 x i8] c"	%\00", align 8
@.STR142 = global [4 x i8] c", %\00", align 8
@.STR141 = global [7 x i8] c" i64 %\00", align 8
@.STR140 = global [12 x i8] c" = icmp slt\00", align 8
@.STR139 = global [3 x i8] c"	%\00", align 8
@.STR138 = global [8 x i8] c" to i64\00", align 8
@.STR137 = global [13 x i8] c" = zext i1 %\00", align 8
@.STR136 = global [3 x i8] c"	%\00", align 8
@.STR135 = global [4 x i8] c", %\00", align 8
@.STR134 = global [7 x i8] c" i64 %\00", align 8
@.STR133 = global [12 x i8] c" = icmp sle\00", align 8
@.STR132 = global [3 x i8] c"	%\00", align 8
@.STR131 = global [8 x i8] c" to i64\00", align 8
@.STR130 = global [13 x i8] c" = zext i1 %\00", align 8
@.STR129 = global [3 x i8] c"	%\00", align 8
@.STR128 = global [4 x i8] c", %\00", align 8
@.STR127 = global [7 x i8] c" i64 %\00", align 8
@.STR126 = global [11 x i8] c" = icmp ne\00", align 8
@.STR125 = global [3 x i8] c"	%\00", align 8
@.STR124 = global [8 x i8] c" to i64\00", align 8
@.STR123 = global [13 x i8] c" = zext i1 %\00", align 8
@.STR122 = global [3 x i8] c"	%\00", align 8
@.STR121 = global [4 x i8] c", %\00", align 8
@.STR120 = global [7 x i8] c" i64 %\00", align 8
@.STR119 = global [11 x i8] c" = icmp eq\00", align 8
@.STR118 = global [3 x i8] c"	%\00", align 8
@.STR117 = global [4 x i8] c", %\00", align 8
@.STR116 = global [7 x i8] c" i64 %\00", align 8
@.STR115 = global [8 x i8] c" = srem\00", align 8
@.STR114 = global [3 x i8] c"	%\00", align 8
@.STR113 = global [4 x i8] c", %\00", align 8
@.STR112 = global [7 x i8] c" i64 %\00", align 8
@.STR111 = global [8 x i8] c" = sdiv\00", align 8
@.STR110 = global [3 x i8] c"	%\00", align 8
@.STR109 = global [4 x i8] c", %\00", align 8
@.STR108 = global [7 x i8] c" i64 %\00", align 8
@.STR107 = global [7 x i8] c" = mul\00", align 8
@.STR106 = global [3 x i8] c"	%\00", align 8
@.STR105 = global [4 x i8] c", %\00", align 8
@.STR104 = global [7 x i8] c" i64 %\00", align 8
@.STR103 = global [7 x i8] c" = sub\00", align 8
@.STR102 = global [3 x i8] c"	%\00", align 8
@.STR101 = global [4 x i8] c", %\00", align 8
@.STR100 = global [7 x i8] c" i64 %\00", align 8
@.STR99 = global [7 x i8] c" = add\00", align 8
@.STR98 = global [3 x i8] c"	%\00", align 8
; function genAddLocal
define i64 @genAddLocal(i64 %0) {
.L511:
	%ident = alloca i64, align 8
	store i64 %0, ptr %ident, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = getelementptr i64, ptr @.STR161, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = call i64 @print(i64 %3)
	store i64 %4, ptr %1, align 8
	%5 = load i64, ptr %ident, align 8
	%6 = call i64 @print(i64 %5)
	store i64 %6, ptr %1, align 8
	%7 = getelementptr i64, ptr @.STR162, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = call i64 @println(i64 %8)
	store i64 %9, ptr %1, align 8
	; load constant 0 into %10
	%10 = add i64 0, 0
	%11 = load i64, ptr %ident, align 8
	%12 = call i64 @symtabAddLocal(i64 %11, i64 %10)
	store i64 %12, ptr %1, align 8
	br label %.L512
.L512:
	%13= load i64, ptr %1, align 8
	ret i64 %13
}

@.STR162 = global [23 x i8] c" = alloca i64, align 8\00", align 8
@.STR161 = global [3 x i8] c"	%\00", align 8
; function genAddGlobal
define i64 @genAddGlobal(i64 %0) {
.L513:
	%ident = alloca i64, align 8
	store i64 %0, ptr %ident, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = load i64, ptr %ident, align 8
	%3 = call i64 @symtabAddGlobal(i64 %2)
	store i64 %3, ptr %1, align 8
	br label %.L514
.L514:
	%4= load i64, ptr %1, align 8
	ret i64 %4
}

; function genDefGlobal
define i64 @genDefGlobal(i64 %0) {
.L515:
	%ident = alloca i64, align 8
	store i64 %0, ptr %ident, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = load i64, ptr %ident, align 8
	%3 = inttoptr i64 %2 to ptr
	%4 = load i8, ptr %3, align 8
	%5 = zext i8 %4 to i64
	; load constant '.' into %6
	%6 = add i64 46, 0
	%7 = icmp ne i64 %5, %6
	%8 = zext i1 %7 to i64
	%9 = sub i64 %8, 0
	%10 = icmp eq i64 %9, 0
	br i1 %10, label %.L517, label %.L518
.L518:
	%11 = getelementptr i64, ptr @.STR163, i64 0
	%12 = ptrtoint ptr %11 to i64
	%13 = call i64 @print(i64 %12)
	store i64 %13, ptr %1, align 8
	%14 = load i64, ptr %ident, align 8
	%15 = call i64 @print(i64 %14)
	store i64 %15, ptr %1, align 8
	%16 = getelementptr i64, ptr @.STR164, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = call i64 @println(i64 %17)
	store i64 %18, ptr %1, align 8
	br label %.L516
.L517:
	br label %.L516
.L516:
	br label %.L519
.L519:
	%19= load i64, ptr %1, align 8
	ret i64 %19
}

@.STR164 = global [16 x i8] c" = global i64 0\00", align 8
@.STR163 = global [2 x i8] c"@\00", align 8
; function i64ToPtr
define i64 @i64ToPtr(i64 %0) {
.L520:
	%val = alloca i64, align 8
	store i64 %0, ptr %val, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%ptr = alloca i64, align 8
	%2 = call i64 @genGetReg()
	%3 = getelementptr i64, ptr %ptr, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %1, align 8
	%7 = getelementptr i64, ptr @.STR165, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = call i64 @print(i64 %8)
	store i64 %9, ptr %1, align 8
	%10 = load i64, ptr %ptr, align 8
	%11 = call i64 @printInt(i64 %10)
	store i64 %11, ptr %1, align 8
	%12 = getelementptr i64, ptr @.STR166, i64 0
	%13 = ptrtoint ptr %12 to i64
	%14 = call i64 @print(i64 %13)
	store i64 %14, ptr %1, align 8
	%15 = load i64, ptr %val, align 8
	%16 = call i64 @printInt(i64 %15)
	store i64 %16, ptr %1, align 8
	%17 = getelementptr i64, ptr @.STR167, i64 0
	%18 = ptrtoint ptr %17 to i64
	%19 = call i64 @println(i64 %18)
	store i64 %19, ptr %1, align 8
	%20 = load i64, ptr %ptr, align 8
	store i64 %20, ptr %1, align 8
	br label %.L521
.L521:
	%21= load i64, ptr %1, align 8
	ret i64 %21
}

@.STR167 = global [8 x i8] c" to ptr\00", align 8
@.STR166 = global [18 x i8] c" = inttoptr i64 %\00", align 8
@.STR165 = global [3 x i8] c"	%\00", align 8
; function ptrToI64
define i64 @ptrToI64(i64 %0) {
.L522:
	%ptr = alloca i64, align 8
	store i64 %0, ptr %ptr, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%val = alloca i64, align 8
	%2 = call i64 @genGetReg()
	%3 = getelementptr i64, ptr %val, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %1, align 8
	%7 = getelementptr i64, ptr @.STR168, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = call i64 @print(i64 %8)
	store i64 %9, ptr %1, align 8
	%10 = load i64, ptr %val, align 8
	%11 = call i64 @printInt(i64 %10)
	store i64 %11, ptr %1, align 8
	%12 = getelementptr i64, ptr @.STR169, i64 0
	%13 = ptrtoint ptr %12 to i64
	%14 = call i64 @print(i64 %13)
	store i64 %14, ptr %1, align 8
	%15 = load i64, ptr %ptr, align 8
	%16 = call i64 @printInt(i64 %15)
	store i64 %16, ptr %1, align 8
	%17 = getelementptr i64, ptr @.STR170, i64 0
	%18 = ptrtoint ptr %17 to i64
	%19 = call i64 @println(i64 %18)
	store i64 %19, ptr %1, align 8
	%20 = load i64, ptr %val, align 8
	store i64 %20, ptr %1, align 8
	br label %.L523
.L523:
	%21= load i64, ptr %1, align 8
	ret i64 %21
}

@.STR170 = global [8 x i8] c" to i64\00", align 8
@.STR169 = global [18 x i8] c" = ptrtoint ptr %\00", align 8
@.STR168 = global [3 x i8] c"	%\00", align 8
; function i8ToI64
define i64 @i8ToI64(i64 %0) {
.L524:
	%val = alloca i64, align 8
	store i64 %0, ptr %val, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%dest = alloca i64, align 8
	%2 = call i64 @genGetReg()
	%3 = getelementptr i64, ptr %dest, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %1, align 8
	%7 = getelementptr i64, ptr @.STR171, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = call i64 @print(i64 %8)
	store i64 %9, ptr %1, align 8
	%10 = load i64, ptr %dest, align 8
	%11 = call i64 @printInt(i64 %10)
	store i64 %11, ptr %1, align 8
	%12 = getelementptr i64, ptr @.STR172, i64 0
	%13 = ptrtoint ptr %12 to i64
	%14 = call i64 @print(i64 %13)
	store i64 %14, ptr %1, align 8
	%15 = load i64, ptr %val, align 8
	%16 = call i64 @printInt(i64 %15)
	store i64 %16, ptr %1, align 8
	%17 = getelementptr i64, ptr @.STR173, i64 0
	%18 = ptrtoint ptr %17 to i64
	%19 = call i64 @println(i64 %18)
	store i64 %19, ptr %1, align 8
	%20 = load i64, ptr %dest, align 8
	store i64 %20, ptr %1, align 8
	br label %.L525
.L525:
	%21= load i64, ptr %1, align 8
	ret i64 %21
}

@.STR173 = global [8 x i8] c" to i64\00", align 8
@.STR172 = global [13 x i8] c" = zext i8 %\00", align 8
@.STR171 = global [3 x i8] c"	%\00", align 8
; function i64ToI8
define i64 @i64ToI8(i64 %0) {
.L526:
	%val = alloca i64, align 8
	store i64 %0, ptr %val, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%dest = alloca i64, align 8
	%2 = call i64 @genGetReg()
	%3 = getelementptr i64, ptr %dest, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %1, align 8
	%7 = getelementptr i64, ptr @.STR174, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = call i64 @print(i64 %8)
	store i64 %9, ptr %1, align 8
	%10 = load i64, ptr %dest, align 8
	%11 = call i64 @printInt(i64 %10)
	store i64 %11, ptr %1, align 8
	%12 = getelementptr i64, ptr @.STR175, i64 0
	%13 = ptrtoint ptr %12 to i64
	%14 = call i64 @print(i64 %13)
	store i64 %14, ptr %1, align 8
	%15 = load i64, ptr %val, align 8
	%16 = call i64 @printInt(i64 %15)
	store i64 %16, ptr %1, align 8
	%17 = getelementptr i64, ptr @.STR176, i64 0
	%18 = ptrtoint ptr %17 to i64
	%19 = call i64 @println(i64 %18)
	store i64 %19, ptr %1, align 8
	%20 = load i64, ptr %dest, align 8
	store i64 %20, ptr %1, align 8
	br label %.L527
.L527:
	%21= load i64, ptr %1, align 8
	ret i64 %21
}

@.STR176 = global [7 x i8] c" to i8\00", align 8
@.STR175 = global [15 x i8] c" = trunc i64 %\00", align 8
@.STR174 = global [3 x i8] c"	%\00", align 8
; function i32ToI64
define i64 @i32ToI64(i64 %0) {
.L528:
	%val = alloca i64, align 8
	store i64 %0, ptr %val, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%dest = alloca i64, align 8
	%2 = call i64 @genGetReg()
	%3 = getelementptr i64, ptr %dest, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %1, align 8
	%7 = getelementptr i64, ptr @.STR177, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = call i64 @print(i64 %8)
	store i64 %9, ptr %1, align 8
	%10 = load i64, ptr %dest, align 8
	%11 = call i64 @printInt(i64 %10)
	store i64 %11, ptr %1, align 8
	%12 = getelementptr i64, ptr @.STR178, i64 0
	%13 = ptrtoint ptr %12 to i64
	%14 = call i64 @print(i64 %13)
	store i64 %14, ptr %1, align 8
	%15 = load i64, ptr %val, align 8
	%16 = call i64 @printInt(i64 %15)
	store i64 %16, ptr %1, align 8
	%17 = getelementptr i64, ptr @.STR179, i64 0
	%18 = ptrtoint ptr %17 to i64
	%19 = call i64 @println(i64 %18)
	store i64 %19, ptr %1, align 8
	%20 = load i64, ptr %dest, align 8
	store i64 %20, ptr %1, align 8
	br label %.L529
.L529:
	%21= load i64, ptr %1, align 8
	ret i64 %21
}

@.STR179 = global [8 x i8] c" to i64\00", align 8
@.STR178 = global [14 x i8] c" = sext i32 %\00", align 8
@.STR177 = global [3 x i8] c"	%\00", align 8
; function genFetchByte
define i64 @genFetchByte(i64 %0) {
.L530:
	%addr = alloca i64, align 8
	store i64 %0, ptr %addr, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = load i64, ptr %addr, align 8
	%3 = call i64 @i64ToPtr(i64 %2)
	%4 = getelementptr i64, ptr %addr, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %1, align 8
	%dest = alloca i64, align 8
	%8 = call i64 @genGetReg()
	%9 = getelementptr i64, ptr %dest, i64 0
	%10 = ptrtoint ptr %9 to i64
	%11 = inttoptr i64 %10 to ptr
	store i64 %8, ptr %11, align 8
	%12  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %1, align 8
	%13 = getelementptr i64, ptr @.STR180, i64 0
	%14 = ptrtoint ptr %13 to i64
	%15 = call i64 @print(i64 %14)
	store i64 %15, ptr %1, align 8
	%16 = load i64, ptr %dest, align 8
	%17 = call i64 @printInt(i64 %16)
	store i64 %17, ptr %1, align 8
	%18 = getelementptr i64, ptr @.STR181, i64 0
	%19 = ptrtoint ptr %18 to i64
	%20 = call i64 @print(i64 %19)
	store i64 %20, ptr %1, align 8
	%21 = load i64, ptr %addr, align 8
	%22 = call i64 @printInt(i64 %21)
	store i64 %22, ptr %1, align 8
	%23 = getelementptr i64, ptr @.STR182, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = call i64 @println(i64 %24)
	store i64 %25, ptr %1, align 8
	%26 = load i64, ptr %dest, align 8
	%27 = call i64 @i8ToI64(i64 %26)
	%28 = getelementptr i64, ptr %dest, i64 0
	%29 = ptrtoint ptr %28 to i64
	%30 = inttoptr i64 %29 to ptr
	store i64 %27, ptr %30, align 8
	%31  = add i64 %27, 0; bloody hack
	store i64 %27, ptr %1, align 8
	br label %.L531
.L531:
	%32= load i64, ptr %1, align 8
	ret i64 %32
}

@.STR182 = global [10 x i8] c", align 8\00", align 8
@.STR181 = global [18 x i8] c" = load i8, ptr %\00", align 8
@.STR180 = global [3 x i8] c"	%\00", align 8
; function genFetch
define i64 @genFetch(i64 %0) {
.L532:
	%addr = alloca i64, align 8
	store i64 %0, ptr %addr, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = load i64, ptr %addr, align 8
	%3 = call i64 @i64ToPtr(i64 %2)
	%4 = getelementptr i64, ptr %addr, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %1, align 8
	%dest = alloca i64, align 8
	%8 = call i64 @genGetReg()
	%9 = getelementptr i64, ptr %dest, i64 0
	%10 = ptrtoint ptr %9 to i64
	%11 = inttoptr i64 %10 to ptr
	store i64 %8, ptr %11, align 8
	%12  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %1, align 8
	%13 = getelementptr i64, ptr @.STR183, i64 0
	%14 = ptrtoint ptr %13 to i64
	%15 = call i64 @print(i64 %14)
	store i64 %15, ptr %1, align 8
	%16 = load i64, ptr %dest, align 8
	%17 = call i64 @printInt(i64 %16)
	store i64 %17, ptr %1, align 8
	%18 = getelementptr i64, ptr @.STR184, i64 0
	%19 = ptrtoint ptr %18 to i64
	%20 = call i64 @print(i64 %19)
	store i64 %20, ptr %1, align 8
	%21 = load i64, ptr %addr, align 8
	%22 = call i64 @printInt(i64 %21)
	store i64 %22, ptr %1, align 8
	%23 = getelementptr i64, ptr @.STR185, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = call i64 @println(i64 %24)
	store i64 %25, ptr %1, align 8
	%26 = load i64, ptr %dest, align 8
	store i64 %26, ptr %1, align 8
	br label %.L533
.L533:
	%27= load i64, ptr %1, align 8
	ret i64 %27
}

@.STR185 = global [10 x i8] c", align 8\00", align 8
@.STR184 = global [19 x i8] c" = load i64, ptr %\00", align 8
@.STR183 = global [3 x i8] c"	%\00", align 8
; function genStoreByte
define i64 @genStoreByte(i64 %0, i64 %1) {
.L534:
	%val = alloca i64, align 8
	store i64 %0, ptr %val, align 8
	%addr = alloca i64, align 8
	store i64 %1, ptr %addr, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%3 = load i64, ptr %addr, align 8
	%4 = call i64 @i64ToPtr(i64 %3)
	%5 = getelementptr i64, ptr %addr, i64 0
	%6 = ptrtoint ptr %5 to i64
	%7 = inttoptr i64 %6 to ptr
	store i64 %4, ptr %7, align 8
	%8  = add i64 %4, 0; bloody hack
	store i64 %4, ptr %2, align 8
	%valI8 = alloca i64, align 8
	%9 = load i64, ptr %val, align 8
	%10 = call i64 @i64ToI8(i64 %9)
	%11 = getelementptr i64, ptr %valI8, i64 0
	%12 = ptrtoint ptr %11 to i64
	%13 = inttoptr i64 %12 to ptr
	store i64 %10, ptr %13, align 8
	%14  = add i64 %10, 0; bloody hack
	store i64 %10, ptr %2, align 8
	%15 = getelementptr i64, ptr @.STR186, i64 0
	%16 = ptrtoint ptr %15 to i64
	%17 = call i64 @print(i64 %16)
	store i64 %17, ptr %2, align 8
	%18 = load i64, ptr %valI8, align 8
	%19 = call i64 @printInt(i64 %18)
	store i64 %19, ptr %2, align 8
	%20 = getelementptr i64, ptr @.STR187, i64 0
	%21 = ptrtoint ptr %20 to i64
	%22 = call i64 @print(i64 %21)
	store i64 %22, ptr %2, align 8
	%23 = load i64, ptr %addr, align 8
	%24 = call i64 @printInt(i64 %23)
	store i64 %24, ptr %2, align 8
	%25 = getelementptr i64, ptr @.STR188, i64 0
	%26 = ptrtoint ptr %25 to i64
	%27 = call i64 @println(i64 %26)
	store i64 %27, ptr %2, align 8
	%hack = alloca i64, align 8
	%28 = call i64 @genGetReg()
	%29 = getelementptr i64, ptr %hack, i64 0
	%30 = ptrtoint ptr %29 to i64
	%31 = inttoptr i64 %30 to ptr
	store i64 %28, ptr %31, align 8
	%32  = add i64 %28, 0; bloody hack
	store i64 %28, ptr %2, align 8
	%33 = getelementptr i64, ptr @.STR189, i64 0
	%34 = ptrtoint ptr %33 to i64
	%35 = call i64 @print(i64 %34)
	store i64 %35, ptr %2, align 8
	%36 = load i64, ptr %hack, align 8
	%37 = call i64 @printInt(i64 %36)
	store i64 %37, ptr %2, align 8
	%38 = getelementptr i64, ptr @.STR190, i64 0
	%39 = ptrtoint ptr %38 to i64
	%40 = call i64 @print(i64 %39)
	store i64 %40, ptr %2, align 8
	%41 = load i64, ptr %val, align 8
	%42 = call i64 @printInt(i64 %41)
	store i64 %42, ptr %2, align 8
	%43 = getelementptr i64, ptr @.STR191, i64 0
	%44 = ptrtoint ptr %43 to i64
	%45 = call i64 @println(i64 %44)
	store i64 %45, ptr %2, align 8
	br label %.L535
.L535:
	%46= load i64, ptr %2, align 8
	ret i64 %46
}

@.STR191 = global [17 x i8] c", 0; bloody hack\00", align 8
@.STR190 = global [14 x i8] c"  = add i64 %\00", align 8
@.STR189 = global [3 x i8] c"	%\00", align 8
@.STR188 = global [10 x i8] c", align 8\00", align 8
@.STR187 = global [8 x i8] c", ptr %\00", align 8
@.STR186 = global [12 x i8] c"	store i8 %\00", align 8
; function genStore
define i64 @genStore(i64 %0, i64 %1) {
.L536:
	%val = alloca i64, align 8
	store i64 %0, ptr %val, align 8
	%addr = alloca i64, align 8
	store i64 %1, ptr %addr, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%3 = load i64, ptr %addr, align 8
	%4 = call i64 @i64ToPtr(i64 %3)
	%5 = getelementptr i64, ptr %addr, i64 0
	%6 = ptrtoint ptr %5 to i64
	%7 = inttoptr i64 %6 to ptr
	store i64 %4, ptr %7, align 8
	%8  = add i64 %4, 0; bloody hack
	store i64 %4, ptr %2, align 8
	%hack = alloca i64, align 8
	%9 = call i64 @genGetReg()
	%10 = getelementptr i64, ptr %hack, i64 0
	%11 = ptrtoint ptr %10 to i64
	%12 = inttoptr i64 %11 to ptr
	store i64 %9, ptr %12, align 8
	%13  = add i64 %9, 0; bloody hack
	store i64 %9, ptr %2, align 8
	%14 = getelementptr i64, ptr @.STR192, i64 0
	%15 = ptrtoint ptr %14 to i64
	%16 = call i64 @print(i64 %15)
	store i64 %16, ptr %2, align 8
	%17 = load i64, ptr %val, align 8
	%18 = call i64 @printInt(i64 %17)
	store i64 %18, ptr %2, align 8
	%19 = getelementptr i64, ptr @.STR193, i64 0
	%20 = ptrtoint ptr %19 to i64
	%21 = call i64 @print(i64 %20)
	store i64 %21, ptr %2, align 8
	%22 = load i64, ptr %addr, align 8
	%23 = call i64 @printInt(i64 %22)
	store i64 %23, ptr %2, align 8
	%24 = getelementptr i64, ptr @.STR194, i64 0
	%25 = ptrtoint ptr %24 to i64
	%26 = call i64 @println(i64 %25)
	store i64 %26, ptr %2, align 8
	%27 = getelementptr i64, ptr @.STR195, i64 0
	%28 = ptrtoint ptr %27 to i64
	%29 = call i64 @print(i64 %28)
	store i64 %29, ptr %2, align 8
	%30 = load i64, ptr %hack, align 8
	%31 = call i64 @printInt(i64 %30)
	store i64 %31, ptr %2, align 8
	%32 = getelementptr i64, ptr @.STR196, i64 0
	%33 = ptrtoint ptr %32 to i64
	%34 = call i64 @print(i64 %33)
	store i64 %34, ptr %2, align 8
	%35 = load i64, ptr %val, align 8
	%36 = call i64 @printInt(i64 %35)
	store i64 %36, ptr %2, align 8
	%37 = getelementptr i64, ptr @.STR197, i64 0
	%38 = ptrtoint ptr %37 to i64
	%39 = call i64 @println(i64 %38)
	store i64 %39, ptr %2, align 8
	br label %.L537
.L537:
	%40= load i64, ptr %2, align 8
	ret i64 %40
}

@.STR197 = global [17 x i8] c", 0; bloody hack\00", align 8
@.STR196 = global [14 x i8] c"  = add i64 %\00", align 8
@.STR195 = global [3 x i8] c"	%\00", align 8
@.STR194 = global [10 x i8] c", align 8\00", align 8
@.STR193 = global [8 x i8] c", ptr %\00", align 8
@.STR192 = global [13 x i8] c"	store i64 %\00", align 8
; function genLoadAddr
define i64 @genLoadAddr(i64 %0) {
.L538:
	%ident = alloca i64, align 8
	store i64 %0, ptr %ident, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%addr = alloca i64, align 8
	%2 = call i64 @genGetReg()
	%3 = getelementptr i64, ptr %addr, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %1, align 8
	%infoPtr = alloca i64, align 8
	%7 = getelementptr i64, ptr @.STR198, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = getelementptr i64, ptr %infoPtr, i64 0
	%10 = ptrtoint ptr %9 to i64
	%11 = inttoptr i64 %10 to ptr
	store i64 %8, ptr %11, align 8
	%12  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %1, align 8
	%13 = load i64, ptr %infoPtr, align 8
	%14 = load i64, ptr %ident, align 8
	%15 = call i64 @symtabGetInfo(i64 %14, i64 %13)
	; load constant 0 into %16
	%16 = add i64 0, 0
	%17 = icmp eq i64 %15, %16
	%18 = zext i1 %17 to i64
	%19 = sub i64 %18, 0
	%20 = icmp eq i64 %19, 0
	br i1 %20, label %.L540, label %.L541
.L541:
	%21 = getelementptr i64, ptr @.STR199, i64 0
	%22 = ptrtoint ptr %21 to i64
	%23 = call i64 @print(i64 %22)
	store i64 %23, ptr %1, align 8
	%24 = load i64, ptr %ident, align 8
	%25 = call i64 @println(i64 %24)
	store i64 %25, ptr %1, align 8
	br label %.L539
.L540:
	br label %.L539
.L539:
	%26 = load i64, ptr %infoPtr, align 8
	%27 = inttoptr i64 %26 to ptr
	%28 = load i64, ptr %27, align 8
	%29 = sub i64 %28, 0
	%30 = icmp eq i64 %29, 0
	br i1 %30, label %.L543, label %.L544
.L544:
	%31 = getelementptr i64, ptr @.STR200, i64 0
	%32 = ptrtoint ptr %31 to i64
	%33 = call i64 @print(i64 %32)
	store i64 %33, ptr %1, align 8
	%34 = load i64, ptr %addr, align 8
	%35 = call i64 @printInt(i64 %34)
	store i64 %35, ptr %1, align 8
	%36 = getelementptr i64, ptr @.STR201, i64 0
	%37 = ptrtoint ptr %36 to i64
	%38 = call i64 @print(i64 %37)
	store i64 %38, ptr %1, align 8
	%39 = load i64, ptr %ident, align 8
	%40 = call i64 @print(i64 %39)
	store i64 %40, ptr %1, align 8
	%41 = getelementptr i64, ptr @.STR202, i64 0
	%42 = ptrtoint ptr %41 to i64
	%43 = call i64 @println(i64 %42)
	store i64 %43, ptr %1, align 8
	br label %.L542
.L543:
	%44 = getelementptr i64, ptr @.STR203, i64 0
	%45 = ptrtoint ptr %44 to i64
	%46 = call i64 @print(i64 %45)
	store i64 %46, ptr %1, align 8
	%47 = load i64, ptr %addr, align 8
	%48 = call i64 @printInt(i64 %47)
	store i64 %48, ptr %1, align 8
	%49 = getelementptr i64, ptr @.STR204, i64 0
	%50 = ptrtoint ptr %49 to i64
	%51 = call i64 @print(i64 %50)
	store i64 %51, ptr %1, align 8
	%52 = load i64, ptr %ident, align 8
	%53 = call i64 @print(i64 %52)
	store i64 %53, ptr %1, align 8
	%54 = getelementptr i64, ptr @.STR205, i64 0
	%55 = ptrtoint ptr %54 to i64
	%56 = call i64 @println(i64 %55)
	store i64 %56, ptr %1, align 8
	br label %.L542
.L542:
	%57 = load i64, ptr %addr, align 8
	%58 = call i64 @ptrToI64(i64 %57)
	%59 = getelementptr i64, ptr %addr, i64 0
	%60 = ptrtoint ptr %59 to i64
	%61 = inttoptr i64 %60 to ptr
	store i64 %58, ptr %61, align 8
	%62  = add i64 %58, 0; bloody hack
	store i64 %58, ptr %1, align 8
	%63 = load i64, ptr %addr, align 8
	store i64 %63, ptr %1, align 8
	br label %.L545
.L545:
	%64= load i64, ptr %1, align 8
	ret i64 %64
}

@.STR205 = global [8 x i8] c", i64 0\00", align 8
@.STR204 = global [28 x i8] c" = getelementptr i64, ptr %\00", align 8
@.STR203 = global [3 x i8] c"	%\00", align 8
@.STR202 = global [8 x i8] c", i64 0\00", align 8
@.STR201 = global [28 x i8] c" = getelementptr i64, ptr @\00", align 8
@.STR200 = global [3 x i8] c"	%\00", align 8
@.STR199 = global [20 x i8] c"unknown identifier \00", align 8
@.STR198 = global [16 x i8] c"16 bytes ......\00", align 8
; function genLoadVar
define i64 @genLoadVar(i64 %0) {
.L546:
	%ident = alloca i64, align 8
	store i64 %0, ptr %ident, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%infoPtr = alloca i64, align 8
	%2 = getelementptr i64, ptr @.STR206, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = getelementptr i64, ptr %infoPtr, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %1, align 8
	%8 = load i64, ptr %infoPtr, align 8
	%9 = load i64, ptr %ident, align 8
	%10 = call i64 @symtabGetInfo(i64 %9, i64 %8)
	; load constant 0 into %11
	%11 = add i64 0, 0
	%12 = icmp eq i64 %10, %11
	%13 = zext i1 %12 to i64
	%14 = sub i64 %13, 0
	%15 = icmp eq i64 %14, 0
	br i1 %15, label %.L548, label %.L549
.L549:
	%16 = getelementptr i64, ptr @.STR207, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = call i64 @print(i64 %17)
	store i64 %18, ptr %1, align 8
	%19 = load i64, ptr %ident, align 8
	%20 = call i64 @println(i64 %19)
	store i64 %20, ptr %1, align 8
	br label %.L547
.L548:
	br label %.L547
.L547:
	%dest = alloca i64, align 8
	%21 = call i64 @genGetReg()
	%22 = getelementptr i64, ptr %dest, i64 0
	%23 = ptrtoint ptr %22 to i64
	%24 = inttoptr i64 %23 to ptr
	store i64 %21, ptr %24, align 8
	%25  = add i64 %21, 0; bloody hack
	store i64 %21, ptr %1, align 8
	%26 = load i64, ptr %infoPtr, align 8
	%27 = inttoptr i64 %26 to ptr
	%28 = load i64, ptr %27, align 8
	%29 = sub i64 %28, 0
	%30 = icmp eq i64 %29, 0
	br i1 %30, label %.L551, label %.L552
.L552:
	%31 = getelementptr i64, ptr @.STR208, i64 0
	%32 = ptrtoint ptr %31 to i64
	%33 = call i64 @print(i64 %32)
	store i64 %33, ptr %1, align 8
	%34 = load i64, ptr %dest, align 8
	%35 = call i64 @printInt(i64 %34)
	store i64 %35, ptr %1, align 8
	%36 = getelementptr i64, ptr @.STR209, i64 0
	%37 = ptrtoint ptr %36 to i64
	%38 = call i64 @print(i64 %37)
	store i64 %38, ptr %1, align 8
	%39 = load i64, ptr %ident, align 8
	%40 = call i64 @print(i64 %39)
	store i64 %40, ptr %1, align 8
	%41 = getelementptr i64, ptr @.STR210, i64 0
	%42 = ptrtoint ptr %41 to i64
	%43 = call i64 @println(i64 %42)
	store i64 %43, ptr %1, align 8
	br label %.L550
.L551:
	%44 = getelementptr i64, ptr @.STR211, i64 0
	%45 = ptrtoint ptr %44 to i64
	%46 = call i64 @print(i64 %45)
	store i64 %46, ptr %1, align 8
	%47 = load i64, ptr %dest, align 8
	%48 = call i64 @printInt(i64 %47)
	store i64 %48, ptr %1, align 8
	%49 = getelementptr i64, ptr @.STR212, i64 0
	%50 = ptrtoint ptr %49 to i64
	%51 = call i64 @print(i64 %50)
	store i64 %51, ptr %1, align 8
	%52 = load i64, ptr %ident, align 8
	%53 = call i64 @print(i64 %52)
	store i64 %53, ptr %1, align 8
	%54 = getelementptr i64, ptr @.STR213, i64 0
	%55 = ptrtoint ptr %54 to i64
	%56 = call i64 @println(i64 %55)
	store i64 %56, ptr %1, align 8
	br label %.L550
.L550:
	%57 = load i64, ptr %dest, align 8
	store i64 %57, ptr %1, align 8
	br label %.L553
.L553:
	%58= load i64, ptr %1, align 8
	ret i64 %58
}

@.STR213 = global [10 x i8] c", align 8\00", align 8
@.STR212 = global [19 x i8] c" = load i64, ptr %\00", align 8
@.STR211 = global [3 x i8] c"	%\00", align 8
@.STR210 = global [10 x i8] c", align 8\00", align 8
@.STR209 = global [19 x i8] c" = load i64, ptr @\00", align 8
@.STR208 = global [3 x i8] c"	%\00", align 8
@.STR207 = global [20 x i8] c"unknown identifier \00", align 8
@.STR206 = global [16 x i8] c"16 bytes ......\00", align 8
; function genCallBegin
define i64 @genCallBegin(i64 %0, i64 %1) {
.L554:
	%fnName = alloca i64, align 8
	store i64 %0, ptr %fnName, align 8
	%numArgs = alloca i64, align 8
	store i64 %1, ptr %numArgs, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%n = alloca i64, align 8
	; load constant 24 into %3
	%3 = add i64 24, 0
	%4 = call i64 @malloc(i64 %3)
	%5 = getelementptr i64, ptr %n, i64 0
	%6 = ptrtoint ptr %5 to i64
	%7 = inttoptr i64 %6 to ptr
	store i64 %4, ptr %7, align 8
	%8  = add i64 %4, 0; bloody hack
	store i64 %4, ptr %2, align 8
	%9 = load i64, ptr @genFnArgStack, align 8
	%10 = load i64, ptr %n, align 8
	; load constant 0 into %11
	%11 = add i64 0, 0
	%12 = add i64 %10, %11
	%13 = inttoptr i64 %12 to ptr
	store i64 %9, ptr %13, align 8
	%14  = add i64 %9, 0; bloody hack
	store i64 %9, ptr %2, align 8
	%15 = load i64, ptr %fnName, align 8
	%16 = load i64, ptr %n, align 8
	; load constant 8 into %17
	%17 = add i64 8, 0
	%18 = add i64 %16, %17
	%19 = inttoptr i64 %18 to ptr
	store i64 %15, ptr %19, align 8
	%20  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %2, align 8
	; load constant 0 into %21
	%21 = add i64 0, 0
	%22 = load i64, ptr %n, align 8
	; load constant 16 into %23
	%23 = add i64 16, 0
	%24 = add i64 %22, %23
	%25 = inttoptr i64 %24 to ptr
	store i64 %21, ptr %25, align 8
	%26  = add i64 %21, 0; bloody hack
	store i64 %21, ptr %2, align 8
	%27 = load i64, ptr %n, align 8
	%28 = getelementptr i64, ptr @genFnArgStack, i64 0
	%29 = ptrtoint ptr %28 to i64
	%30 = inttoptr i64 %29 to ptr
	store i64 %27, ptr %30, align 8
	%31  = add i64 %27, 0; bloody hack
	store i64 %27, ptr %2, align 8
	br label %.L555
.L555:
	%32= load i64, ptr %2, align 8
	ret i64 %32
}

; function genCallAddArg
define i64 @genCallAddArg(i64 %0, i64 %1) {
.L556:
	%argReg = alloca i64, align 8
	store i64 %0, ptr %argReg, align 8
	%argPos = alloca i64, align 8
	store i64 %1, ptr %argPos, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%n = alloca i64, align 8
	; load constant 16 into %3
	%3 = add i64 16, 0
	%4 = call i64 @malloc(i64 %3)
	%5 = getelementptr i64, ptr %n, i64 0
	%6 = ptrtoint ptr %5 to i64
	%7 = inttoptr i64 %6 to ptr
	store i64 %4, ptr %7, align 8
	%8  = add i64 %4, 0; bloody hack
	store i64 %4, ptr %2, align 8
	%9 = load i64, ptr @genFnArgStack, align 8
	; load constant 16 into %10
	%10 = add i64 16, 0
	%11 = add i64 %9, %10
	%12 = inttoptr i64 %11 to ptr
	%13 = load i64, ptr %12, align 8
	%14 = load i64, ptr %n, align 8
	; load constant 0 into %15
	%15 = add i64 0, 0
	%16 = add i64 %14, %15
	%17 = inttoptr i64 %16 to ptr
	store i64 %13, ptr %17, align 8
	%18  = add i64 %13, 0; bloody hack
	store i64 %13, ptr %2, align 8
	%19 = load i64, ptr %argReg, align 8
	%20 = load i64, ptr %n, align 8
	; load constant 8 into %21
	%21 = add i64 8, 0
	%22 = add i64 %20, %21
	%23 = inttoptr i64 %22 to ptr
	store i64 %19, ptr %23, align 8
	%24  = add i64 %19, 0; bloody hack
	store i64 %19, ptr %2, align 8
	%25 = load i64, ptr %n, align 8
	%26 = load i64, ptr @genFnArgStack, align 8
	; load constant 16 into %27
	%27 = add i64 16, 0
	%28 = add i64 %26, %27
	%29 = inttoptr i64 %28 to ptr
	store i64 %25, ptr %29, align 8
	%30  = add i64 %25, 0; bloody hack
	store i64 %25, ptr %2, align 8
	br label %.L557
.L557:
	%31= load i64, ptr %2, align 8
	ret i64 %31
}

; function genCallEnd
define i64 @genCallEnd() {
.L558:
	%0 = alloca i64, align 8 ; ptr to ret val
	%extend = alloca i64, align 8
	; load constant 0 into %1
	%1 = add i64 0, 0
	%2 = getelementptr i64, ptr %extend, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = inttoptr i64 %3 to ptr
	store i64 %1, ptr %4, align 8
	%5  = add i64 %1, 0; bloody hack
	store i64 %1, ptr %0, align 8
	%retVal = alloca i64, align 8
	%6 = call i64 @genGetReg()
	%7 = getelementptr i64, ptr %retVal, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = inttoptr i64 %8 to ptr
	store i64 %6, ptr %9, align 8
	%10  = add i64 %6, 0; bloody hack
	store i64 %6, ptr %0, align 8
	%11 = load i64, ptr @genFnArgStack, align 8
	; load constant 8 into %12
	%12 = add i64 8, 0
	%13 = add i64 %11, %12
	%14 = inttoptr i64 %13 to ptr
	%15 = load i64, ptr %14, align 8
	%16 = getelementptr i64, ptr @.STR214, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = call i64 @UStrCreate(i64 %17)
	%19 = icmp eq i64 %15, %18
	%20 = zext i1 %19 to i64
	%21 = sub i64 %20, 0
	%22 = icmp eq i64 %21, 0
	br i1 %22, label %.L560, label %.L561
.L561:
	%23 = getelementptr i64, ptr @.STR215, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = call i64 @print(i64 %24)
	store i64 %25, ptr %0, align 8
	%26 = load i64, ptr %retVal, align 8
	%27 = call i64 @printInt(i64 %26)
	store i64 %27, ptr %0, align 8
	%28 = getelementptr i64, ptr @.STR216, i64 0
	%29 = ptrtoint ptr %28 to i64
	%30 = call i64 @print(i64 %29)
	store i64 %30, ptr %0, align 8
	%31 = load i64, ptr @genFnArgStack, align 8
	; load constant 8 into %32
	%32 = add i64 8, 0
	%33 = add i64 %31, %32
	%34 = inttoptr i64 %33 to ptr
	%35 = load i64, ptr %34, align 8
	%36 = call i64 @print(i64 %35)
	store i64 %36, ptr %0, align 8
	%37 = getelementptr i64, ptr @.STR217, i64 0
	%38 = ptrtoint ptr %37 to i64
	%39 = call i64 @print(i64 %38)
	store i64 %39, ptr %0, align 8
	; load constant 1 into %40
	%40 = add i64 1, 0
	%41 = getelementptr i64, ptr %extend, i64 0
	%42 = ptrtoint ptr %41 to i64
	%43 = inttoptr i64 %42 to ptr
	store i64 %40, ptr %43, align 8
	%44  = add i64 %40, 0; bloody hack
	store i64 %40, ptr %0, align 8
	br label %.L559
.L560:
	%45 = getelementptr i64, ptr @.STR218, i64 0
	%46 = ptrtoint ptr %45 to i64
	%47 = call i64 @print(i64 %46)
	store i64 %47, ptr %0, align 8
	%48 = load i64, ptr %retVal, align 8
	%49 = call i64 @printInt(i64 %48)
	store i64 %49, ptr %0, align 8
	%50 = getelementptr i64, ptr @.STR219, i64 0
	%51 = ptrtoint ptr %50 to i64
	%52 = call i64 @print(i64 %51)
	store i64 %52, ptr %0, align 8
	%53 = load i64, ptr @genFnArgStack, align 8
	; load constant 8 into %54
	%54 = add i64 8, 0
	%55 = add i64 %53, %54
	%56 = inttoptr i64 %55 to ptr
	%57 = load i64, ptr %56, align 8
	%58 = call i64 @print(i64 %57)
	store i64 %58, ptr %0, align 8
	%59 = getelementptr i64, ptr @.STR220, i64 0
	%60 = ptrtoint ptr %59 to i64
	%61 = call i64 @print(i64 %60)
	store i64 %61, ptr %0, align 8
	br label %.L559
.L559:
	%n = alloca i64, align 8
	%62 = load i64, ptr @genFnArgStack, align 8
	; load constant 16 into %63
	%63 = add i64 16, 0
	%64 = add i64 %62, %63
	%65 = inttoptr i64 %64 to ptr
	%66 = load i64, ptr %65, align 8
	%67 = getelementptr i64, ptr %n, i64 0
	%68 = ptrtoint ptr %67 to i64
	%69 = inttoptr i64 %68 to ptr
	store i64 %66, ptr %69, align 8
	%70  = add i64 %66, 0; bloody hack
	store i64 %66, ptr %0, align 8
	%f = alloca i64, align 8
	br label %.L562
.L562:
	%71 = load i64, ptr %n, align 8
	%72 = sub i64 %71, 0
	%73 = icmp eq i64 %72, 0
	br i1 %73, label %.L563, label %.L564
.L564:
	%74 = getelementptr i64, ptr @.STR221, i64 0
	%75 = ptrtoint ptr %74 to i64
	%76 = call i64 @print(i64 %75)
	store i64 %76, ptr %0, align 8
	%77 = load i64, ptr %n, align 8
	; load constant 8 into %78
	%78 = add i64 8, 0
	%79 = add i64 %77, %78
	%80 = inttoptr i64 %79 to ptr
	%81 = load i64, ptr %80, align 8
	%82 = call i64 @printInt(i64 %81)
	store i64 %82, ptr %0, align 8
	%83 = load i64, ptr %n, align 8
	%84 = inttoptr i64 %83 to ptr
	%85 = load i64, ptr %84, align 8
	%86 = sub i64 %85, 0
	%87 = icmp eq i64 %86, 0
	br i1 %87, label %.L566, label %.L567
.L567:
	%88 = getelementptr i64, ptr @.STR222, i64 0
	%89 = ptrtoint ptr %88 to i64
	%90 = call i64 @print(i64 %89)
	store i64 %90, ptr %0, align 8
	br label %.L565
.L566:
	br label %.L565
.L565:
	%91 = load i64, ptr %n, align 8
	%92 = getelementptr i64, ptr %f, i64 0
	%93 = ptrtoint ptr %92 to i64
	%94 = inttoptr i64 %93 to ptr
	store i64 %91, ptr %94, align 8
	%95  = add i64 %91, 0; bloody hack
	store i64 %91, ptr %0, align 8
	%96 = load i64, ptr %n, align 8
	%97 = inttoptr i64 %96 to ptr
	%98 = load i64, ptr %97, align 8
	%99 = getelementptr i64, ptr %n, i64 0
	%100 = ptrtoint ptr %99 to i64
	%101 = inttoptr i64 %100 to ptr
	store i64 %98, ptr %101, align 8
	%102  = add i64 %98, 0; bloody hack
	store i64 %98, ptr %0, align 8
	%103 = load i64, ptr %f, align 8
	%104 = call i64 @free(i64 %103)
	store i64 %104, ptr %0, align 8
	br label %.L562
.L563:
	%105 = getelementptr i64, ptr @.STR223, i64 0
	%106 = ptrtoint ptr %105 to i64
	%107 = call i64 @println(i64 %106)
	store i64 %107, ptr %0, align 8
	%108 = load i64, ptr @genFnArgStack, align 8
	%109 = getelementptr i64, ptr %f, i64 0
	%110 = ptrtoint ptr %109 to i64
	%111 = inttoptr i64 %110 to ptr
	store i64 %108, ptr %111, align 8
	%112  = add i64 %108, 0; bloody hack
	store i64 %108, ptr %0, align 8
	%113 = load i64, ptr @genFnArgStack, align 8
	%114 = inttoptr i64 %113 to ptr
	%115 = load i64, ptr %114, align 8
	%116 = getelementptr i64, ptr @genFnArgStack, i64 0
	%117 = ptrtoint ptr %116 to i64
	%118 = inttoptr i64 %117 to ptr
	store i64 %115, ptr %118, align 8
	%119  = add i64 %115, 0; bloody hack
	store i64 %115, ptr %0, align 8
	%120 = load i64, ptr %f, align 8
	%121 = call i64 @free(i64 %120)
	store i64 %121, ptr %0, align 8
	%122 = load i64, ptr %extend, align 8
	%123 = sub i64 %122, 0
	%124 = icmp eq i64 %123, 0
	br i1 %124, label %.L569, label %.L570
.L570:
	%125 = load i64, ptr %retVal, align 8
	%126 = call i64 @i32ToI64(i64 %125)
	%127 = getelementptr i64, ptr %retVal, i64 0
	%128 = ptrtoint ptr %127 to i64
	%129 = inttoptr i64 %128 to ptr
	store i64 %126, ptr %129, align 8
	%130  = add i64 %126, 0; bloody hack
	store i64 %126, ptr %0, align 8
	br label %.L568
.L569:
	br label %.L568
.L568:
	%131 = load i64, ptr %retVal, align 8
	store i64 %131, ptr %0, align 8
	br label %.L571
.L571:
	%132= load i64, ptr %0, align 8
	ret i64 %132
}

@.STR223 = global [2 x i8] c")\00", align 8
@.STR222 = global [3 x i8] c", \00", align 8
@.STR221 = global [6 x i8] c"i64 %\00", align 8
@.STR220 = global [2 x i8] c"(\00", align 8
@.STR219 = global [14 x i8] c" = call i64 @\00", align 8
@.STR218 = global [3 x i8] c"	%\00", align 8
@.STR217 = global [2 x i8] c"(\00", align 8
@.STR216 = global [14 x i8] c" = call i32 @\00", align 8
@.STR215 = global [3 x i8] c"	%\00", align 8
@.STR214 = global [8 x i8] c"getchar\00", align 8
; function genGetTmp
define i64 @genGetTmp() {
.L572:
	%0 = alloca i64, align 8 ; ptr to ret val
	%name = alloca i64, align 8
	%1 = getelementptr i64, ptr @.STR224, i64 0
	%2 = ptrtoint ptr %1 to i64
	%3 = getelementptr i64, ptr %name, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %0, align 8
	%7 = load i64, ptr %name, align 8
	; load constant 4 into %8
	%8 = add i64 4, 0
	%9 = add i64 %7, %8
	%10 = load i64, ptr @genTmpCount, align 8
	%11 = call i64 @sprintInt(i64 %10, i64 %9)
	store i64 %11, ptr %0, align 8
	%12 = load i64, ptr @genTmpCount, align 8
	; load constant 1 into %13
	%13 = add i64 1, 0
	%14 = add i64 %12, %13
	%15 = getelementptr i64, ptr @genTmpCount, i64 0
	%16 = ptrtoint ptr %15 to i64
	%17 = inttoptr i64 %16 to ptr
	store i64 %14, ptr %17, align 8
	%18  = add i64 %14, 0; bloody hack
	store i64 %14, ptr %0, align 8
	%ident = alloca i64, align 8
	%19 = load i64, ptr %name, align 8
	%20 = call i64 @UStrCreate(i64 %19)
	%21 = getelementptr i64, ptr %ident, i64 0
	%22 = ptrtoint ptr %21 to i64
	%23 = inttoptr i64 %22 to ptr
	store i64 %20, ptr %23, align 8
	%24  = add i64 %20, 0; bloody hack
	store i64 %20, ptr %0, align 8
	%25 = load i64, ptr %ident, align 8
	%26 = call i64 @genAddLocal(i64 %25)
	store i64 %26, ptr %0, align 8
	%27 = load i64, ptr %ident, align 8
	store i64 %27, ptr %0, align 8
	br label %.L573
.L573:
	%28= load i64, ptr %0, align 8
	ret i64 %28
}

@.STR224 = global [15 x i8] c".TMPxxxxxxxxxx\00", align 8
; function genSaveBoolInTmp
define i64 @genSaveBoolInTmp(i64 %0, i64 %1) {
.L574:
	%val = alloca i64, align 8
	store i64 %0, ptr %val, align 8
	%tmp = alloca i64, align 8
	store i64 %1, ptr %tmp, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%addr = alloca i64, align 8
	%3 = load i64, ptr %tmp, align 8
	%4 = call i64 @genLoadAddr(i64 %3)
	%5 = getelementptr i64, ptr %addr, i64 0
	%6 = ptrtoint ptr %5 to i64
	%7 = inttoptr i64 %6 to ptr
	store i64 %4, ptr %7, align 8
	%8  = add i64 %4, 0; bloody hack
	store i64 %4, ptr %2, align 8
	%valReg = alloca i64, align 8
	%9 = load i64, ptr %val, align 8
	%10 = sub i64 %9, 0
	%11 = icmp eq i64 %10, 0
	br i1 %11, label %.L576, label %.L577
.L577:
	%12 = getelementptr i64, ptr @.STR225, i64 0
	%13 = ptrtoint ptr %12 to i64
	%14 = call i64 @UStrCreate(i64 %13)
	%15 = call i64 @genConstant(i64 %14)
	%16 = getelementptr i64, ptr %valReg, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = inttoptr i64 %17 to ptr
	store i64 %15, ptr %18, align 8
	%19  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %2, align 8
	br label %.L575
.L576:
	%20 = getelementptr i64, ptr @.STR226, i64 0
	%21 = ptrtoint ptr %20 to i64
	%22 = call i64 @UStrCreate(i64 %21)
	%23 = call i64 @genConstant(i64 %22)
	%24 = getelementptr i64, ptr %valReg, i64 0
	%25 = ptrtoint ptr %24 to i64
	%26 = inttoptr i64 %25 to ptr
	store i64 %23, ptr %26, align 8
	%27  = add i64 %23, 0; bloody hack
	store i64 %23, ptr %2, align 8
	br label %.L575
.L575:
	%28 = load i64, ptr %addr, align 8
	%29 = load i64, ptr %valReg, align 8
	%30 = call i64 @genStore(i64 %29, i64 %28)
	store i64 %30, ptr %2, align 8
	br label %.L578
.L578:
	%31= load i64, ptr %2, align 8
	ret i64 %31
}

@.STR226 = global [2 x i8] c"0\00", align 8
@.STR225 = global [2 x i8] c"1\00", align 8
; function genLoadFromTmp
define i64 @genLoadFromTmp(i64 %0) {
.L579:
	%tmp = alloca i64, align 8
	store i64 %0, ptr %tmp, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%addr = alloca i64, align 8
	%2 = load i64, ptr %tmp, align 8
	%3 = call i64 @genLoadAddr(i64 %2)
	%4 = getelementptr i64, ptr %addr, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %1, align 8
	%8 = load i64, ptr %addr, align 8
	%9 = call i64 @genFetch(i64 %8)
	store i64 %9, ptr %1, align 8
	br label %.L580
.L580:
	%10= load i64, ptr %1, align 8
	ret i64 %10
}

; function genStoreReturnVal
define i64 @genStoreReturnVal(i64 %0) {
.L581:
	%retVal = alloca i64, align 8
	store i64 %0, ptr %retVal, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = getelementptr i64, ptr @.STR227, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = call i64 @print(i64 %3)
	store i64 %4, ptr %1, align 8
	%5 = load i64, ptr %retVal, align 8
	%6 = call i64 @printInt(i64 %5)
	store i64 %6, ptr %1, align 8
	%7 = getelementptr i64, ptr @.STR228, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = call i64 @print(i64 %8)
	store i64 %9, ptr %1, align 8
	%10 = load i64, ptr @genFunctionBuildingInfo, align 8
	; load constant 16 into %11
	%11 = add i64 16, 0
	%12 = add i64 %10, %11
	%13 = inttoptr i64 %12 to ptr
	%14 = load i64, ptr %13, align 8
	%15 = call i64 @printInt(i64 %14)
	store i64 %15, ptr %1, align 8
	%16 = getelementptr i64, ptr @.STR229, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = call i64 @println(i64 %17)
	store i64 %18, ptr %1, align 8
	br label %.L582
.L582:
	%19= load i64, ptr %1, align 8
	ret i64 %19
}

@.STR229 = global [10 x i8] c", align 8\00", align 8
@.STR228 = global [8 x i8] c", ptr %\00", align 8
@.STR227 = global [13 x i8] c"	store i64 %\00", align 8
; function testGen
define i64 @testGen() {
.L583:
	%0 = alloca i64, align 8 ; ptr to ret val
	%foo = alloca i64, align 8
	%1 = getelementptr i64, ptr @.STR230, i64 0
	%2 = ptrtoint ptr %1 to i64
	%3 = getelementptr i64, ptr %foo, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %0, align 8
	; load constant 34 into %7
	%7 = add i64 34, 0
	%8 = load i64, ptr %foo, align 8
	; load constant 0 into %9
	%9 = add i64 0, 0
	%10 = add i64 %8, %9
	%11 = inttoptr i64 %10 to ptr
	%12 = trunc i64 %7 to i8
	store i8 %12, ptr %11, align 8
	%13  = add i64 %7, 0; bloody hack
	store i64 %7, ptr %0, align 8
	; load constant 34 into %14
	%14 = add i64 34, 0
	%15 = load i64, ptr %foo, align 8
	; load constant 4 into %16
	%16 = add i64 4, 0
	%17 = add i64 %15, %16
	%18 = inttoptr i64 %17 to ptr
	%19 = trunc i64 %14 to i8
	store i8 %19, ptr %18, align 8
	%20  = add i64 %14, 0; bloody hack
	store i64 %14, ptr %0, align 8
	%21 = load i64, ptr %foo, align 8
	%22 = call i64 @UStrCreate(i64 %21)
	%23 = getelementptr i64, ptr %foo, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = inttoptr i64 %24 to ptr
	store i64 %22, ptr %25, align 8
	%26  = add i64 %22, 0; bloody hack
	store i64 %22, ptr %0, align 8
	%27 = call i64 @genInitCode()
	store i64 %27, ptr %0, align 8
	%28 = load i64, ptr %foo, align 8
	%29 = call i64 @genDefString(i64 %28)
	store i64 %29, ptr %0, align 8
	%30 = load i64, ptr %foo, align 8
	%31 = call i64 @genDefString(i64 %30)
	store i64 %31, ptr %0, align 8
	%32 = load i64, ptr %foo, align 8
	%33 = call i64 @genDefString(i64 %32)
	store i64 %33, ptr %0, align 8
	%34 = load i64, ptr %foo, align 8
	%35 = call i64 @genDefString(i64 %34)
	store i64 %35, ptr %0, align 8
	%36 = load i64, ptr %foo, align 8
	%37 = call i64 @genDefString(i64 %36)
	store i64 %37, ptr %0, align 8
	%38 = load i64, ptr %foo, align 8
	%39 = call i64 @genDefString(i64 %38)
	store i64 %39, ptr %0, align 8
	%40 = load i64, ptr %foo, align 8
	%41 = call i64 @genDefString(i64 %40)
	store i64 %41, ptr %0, align 8
	%42 = load i64, ptr %foo, align 8
	%43 = call i64 @genDefString(i64 %42)
	store i64 %43, ptr %0, align 8
	%44 = load i64, ptr %foo, align 8
	%45 = call i64 @genDefString(i64 %44)
	store i64 %45, ptr %0, align 8
	%46 = load i64, ptr %foo, align 8
	%47 = call i64 @genDefString(i64 %46)
	store i64 %47, ptr %0, align 8
	%48 = load i64, ptr %foo, align 8
	%49 = call i64 @genDefString(i64 %48)
	store i64 %49, ptr %0, align 8
	%50 = load i64, ptr %foo, align 8
	%51 = call i64 @genDefString(i64 %50)
	store i64 %51, ptr %0, align 8
	%52 = load i64, ptr %foo, align 8
	%53 = call i64 @genDefString(i64 %52)
	store i64 %53, ptr %0, align 8
	%54 = load i64, ptr %foo, align 8
	%55 = call i64 @genDefString(i64 %54)
	store i64 %55, ptr %0, align 8
	%56 = load i64, ptr %foo, align 8
	%57 = call i64 @genDefString(i64 %56)
	store i64 %57, ptr %0, align 8
	%58 = load i64, ptr %foo, align 8
	%59 = call i64 @genDefString(i64 %58)
	store i64 %59, ptr %0, align 8
	%60 = load i64, ptr %foo, align 8
	%61 = call i64 @genDefString(i64 %60)
	store i64 %61, ptr %0, align 8
	%62 = load i64, ptr %foo, align 8
	%63 = call i64 @genDefString(i64 %62)
	store i64 %63, ptr %0, align 8
	%64 = load i64, ptr %foo, align 8
	%65 = call i64 @genDefString(i64 %64)
	store i64 %65, ptr %0, align 8
	%66 = load i64, ptr %foo, align 8
	%67 = call i64 @genDefString(i64 %66)
	store i64 %67, ptr %0, align 8
	%68 = getelementptr i64, ptr @.STR231, i64 0
	%69 = ptrtoint ptr %68 to i64
	%70 = call i64 @UStrCreate(i64 %69)
	%71 = call i64 @genAddGlobal(i64 %70)
	store i64 %71, ptr %0, align 8
	%72 = getelementptr i64, ptr @.STR232, i64 0
	%73 = ptrtoint ptr %72 to i64
	%74 = call i64 @UStrCreate(i64 %73)
	%75 = call i64 @genAddGlobal(i64 %74)
	store i64 %75, ptr %0, align 8
	%76 = getelementptr i64, ptr @.STR233, i64 0
	%77 = ptrtoint ptr %76 to i64
	%78 = call i64 @UStrCreate(i64 %77)
	%79 = call i64 @genFuncDefParam(i64 %78)
	store i64 %79, ptr %0, align 8
	%80 = getelementptr i64, ptr @.STR234, i64 0
	%81 = ptrtoint ptr %80 to i64
	%82 = call i64 @UStrCreate(i64 %81)
	%83 = call i64 @genFuncDefParam(i64 %82)
	store i64 %83, ptr %0, align 8
	%84 = getelementptr i64, ptr @.STR235, i64 0
	%85 = ptrtoint ptr %84 to i64
	%86 = call i64 @UStrCreate(i64 %85)
	%87 = call i64 @genFuncDefParam(i64 %86)
	store i64 %87, ptr %0, align 8
	%88 = getelementptr i64, ptr @.STR236, i64 0
	%89 = ptrtoint ptr %88 to i64
	%90 = call i64 @UStrCreate(i64 %89)
	%91 = call i64 @genFuncDefBegin(i64 %90)
	store i64 %91, ptr %0, align 8
	%92 = call i64 @genGetLabel()
	%93 = call i64 @genDefLabel(i64 %92)
	store i64 %93, ptr %0, align 8
	%x = alloca i64, align 8
	%y = alloca i64, align 8
	%c1 = alloca i64, align 8
	%c2 = alloca i64, align 8
	%c3 = alloca i64, align 8
	%94 = getelementptr i64, ptr @.STR237, i64 0
	%95 = ptrtoint ptr %94 to i64
	%96 = call i64 @UStrCreate(i64 %95)
	%97 = call i64 @genAddLocal(i64 %96)
	%98 = getelementptr i64, ptr %x, i64 0
	%99 = ptrtoint ptr %98 to i64
	%100 = inttoptr i64 %99 to ptr
	store i64 %97, ptr %100, align 8
	%101  = add i64 %97, 0; bloody hack
	store i64 %97, ptr %0, align 8
	%102 = getelementptr i64, ptr @.STR238, i64 0
	%103 = ptrtoint ptr %102 to i64
	%104 = call i64 @UStrCreate(i64 %103)
	%105 = call i64 @genConstant(i64 %104)
	%106 = getelementptr i64, ptr %c1, i64 0
	%107 = ptrtoint ptr %106 to i64
	%108 = inttoptr i64 %107 to ptr
	store i64 %105, ptr %108, align 8
	%109  = add i64 %105, 0; bloody hack
	store i64 %105, ptr %0, align 8
	%110 = getelementptr i64, ptr @.STR239, i64 0
	%111 = ptrtoint ptr %110 to i64
	%112 = call i64 @UStrCreate(i64 %111)
	%113 = call i64 @genConstant(i64 %112)
	%114 = getelementptr i64, ptr %c2, i64 0
	%115 = ptrtoint ptr %114 to i64
	%116 = inttoptr i64 %115 to ptr
	store i64 %113, ptr %116, align 8
	%117  = add i64 %113, 0; bloody hack
	store i64 %113, ptr %0, align 8
	%118 = getelementptr i64, ptr @.STR240, i64 0
	%119 = ptrtoint ptr %118 to i64
	%120 = call i64 @UStrCreate(i64 %119)
	%121 = call i64 @genConstant(i64 %120)
	%122 = getelementptr i64, ptr %c3, i64 0
	%123 = ptrtoint ptr %122 to i64
	%124 = inttoptr i64 %123 to ptr
	store i64 %121, ptr %124, align 8
	%125  = add i64 %121, 0; bloody hack
	store i64 %121, ptr %0, align 8
	%126 = getelementptr i64, ptr @.STR241, i64 0
	%127 = ptrtoint ptr %126 to i64
	%128 = call i64 @UStrCreate(i64 %127)
	%129 = call i64 @genLoadVar(i64 %128)
	%130 = getelementptr i64, ptr %x, i64 0
	%131 = ptrtoint ptr %130 to i64
	%132 = inttoptr i64 %131 to ptr
	store i64 %129, ptr %132, align 8
	%133  = add i64 %129, 0; bloody hack
	store i64 %129, ptr %0, align 8
	%134 = getelementptr i64, ptr @.STR242, i64 0
	%135 = ptrtoint ptr %134 to i64
	%136 = call i64 @UStrCreate(i64 %135)
	%137 = call i64 @genLoadAddr(i64 %136)
	%138 = getelementptr i64, ptr %y, i64 0
	%139 = ptrtoint ptr %138 to i64
	%140 = inttoptr i64 %139 to ptr
	store i64 %137, ptr %140, align 8
	%141  = add i64 %137, 0; bloody hack
	store i64 %137, ptr %0, align 8
	%142 = load i64, ptr %y, align 8
	%143 = load i64, ptr %x, align 8
	; load constant 0 into %144
	%144 = add i64 0, 0
	%145 = call i64 @genInstr(i64 %144, i64 %143, i64 %142)
	%146 = getelementptr i64, ptr %x, i64 0
	%147 = ptrtoint ptr %146 to i64
	%148 = inttoptr i64 %147 to ptr
	store i64 %145, ptr %148, align 8
	%149  = add i64 %145, 0; bloody hack
	store i64 %145, ptr %0, align 8
	%150 = load i64, ptr %y, align 8
	%151 = load i64, ptr %x, align 8
	; load constant 1 into %152
	%152 = add i64 1, 0
	%153 = call i64 @genInstr(i64 %152, i64 %151, i64 %150)
	%154 = getelementptr i64, ptr %x, i64 0
	%155 = ptrtoint ptr %154 to i64
	%156 = inttoptr i64 %155 to ptr
	store i64 %153, ptr %156, align 8
	%157  = add i64 %153, 0; bloody hack
	store i64 %153, ptr %0, align 8
	%158 = load i64, ptr %y, align 8
	%159 = load i64, ptr %x, align 8
	; load constant 2 into %160
	%160 = add i64 2, 0
	%161 = call i64 @genInstr(i64 %160, i64 %159, i64 %158)
	%162 = getelementptr i64, ptr %x, i64 0
	%163 = ptrtoint ptr %162 to i64
	%164 = inttoptr i64 %163 to ptr
	store i64 %161, ptr %164, align 8
	%165  = add i64 %161, 0; bloody hack
	store i64 %161, ptr %0, align 8
	%166 = load i64, ptr %y, align 8
	%167 = load i64, ptr %x, align 8
	; load constant 3 into %168
	%168 = add i64 3, 0
	%169 = call i64 @genInstr(i64 %168, i64 %167, i64 %166)
	%170 = getelementptr i64, ptr %x, i64 0
	%171 = ptrtoint ptr %170 to i64
	%172 = inttoptr i64 %171 to ptr
	store i64 %169, ptr %172, align 8
	%173  = add i64 %169, 0; bloody hack
	store i64 %169, ptr %0, align 8
	%174 = load i64, ptr %y, align 8
	%175 = load i64, ptr %x, align 8
	; load constant 4 into %176
	%176 = add i64 4, 0
	%177 = call i64 @genInstr(i64 %176, i64 %175, i64 %174)
	%178 = getelementptr i64, ptr %x, i64 0
	%179 = ptrtoint ptr %178 to i64
	%180 = inttoptr i64 %179 to ptr
	store i64 %177, ptr %180, align 8
	%181  = add i64 %177, 0; bloody hack
	store i64 %177, ptr %0, align 8
	%182 = load i64, ptr %y, align 8
	%183 = load i64, ptr %x, align 8
	; load constant 5 into %184
	%184 = add i64 5, 0
	%185 = call i64 @genInstr(i64 %184, i64 %183, i64 %182)
	%186 = getelementptr i64, ptr %x, i64 0
	%187 = ptrtoint ptr %186 to i64
	%188 = inttoptr i64 %187 to ptr
	store i64 %185, ptr %188, align 8
	%189  = add i64 %185, 0; bloody hack
	store i64 %185, ptr %0, align 8
	%190 = load i64, ptr %y, align 8
	%191 = load i64, ptr %x, align 8
	; load constant 6 into %192
	%192 = add i64 6, 0
	%193 = call i64 @genInstr(i64 %192, i64 %191, i64 %190)
	%194 = getelementptr i64, ptr %x, i64 0
	%195 = ptrtoint ptr %194 to i64
	%196 = inttoptr i64 %195 to ptr
	store i64 %193, ptr %196, align 8
	%197  = add i64 %193, 0; bloody hack
	store i64 %193, ptr %0, align 8
	%198 = load i64, ptr %y, align 8
	%199 = load i64, ptr %x, align 8
	; load constant 7 into %200
	%200 = add i64 7, 0
	%201 = call i64 @genInstr(i64 %200, i64 %199, i64 %198)
	%202 = getelementptr i64, ptr %x, i64 0
	%203 = ptrtoint ptr %202 to i64
	%204 = inttoptr i64 %203 to ptr
	store i64 %201, ptr %204, align 8
	%205  = add i64 %201, 0; bloody hack
	store i64 %201, ptr %0, align 8
	%206 = load i64, ptr %y, align 8
	%207 = load i64, ptr %x, align 8
	; load constant 8 into %208
	%208 = add i64 8, 0
	%209 = call i64 @genInstr(i64 %208, i64 %207, i64 %206)
	%210 = getelementptr i64, ptr %x, i64 0
	%211 = ptrtoint ptr %210 to i64
	%212 = inttoptr i64 %211 to ptr
	store i64 %209, ptr %212, align 8
	%213  = add i64 %209, 0; bloody hack
	store i64 %209, ptr %0, align 8
	%214 = load i64, ptr %y, align 8
	%215 = load i64, ptr %x, align 8
	; load constant 9 into %216
	%216 = add i64 9, 0
	%217 = call i64 @genInstr(i64 %216, i64 %215, i64 %214)
	%218 = getelementptr i64, ptr %x, i64 0
	%219 = ptrtoint ptr %218 to i64
	%220 = inttoptr i64 %219 to ptr
	store i64 %217, ptr %220, align 8
	%221  = add i64 %217, 0; bloody hack
	store i64 %217, ptr %0, align 8
	%222 = load i64, ptr %y, align 8
	%223 = load i64, ptr %x, align 8
	; load constant 10 into %224
	%224 = add i64 10, 0
	%225 = call i64 @genInstr(i64 %224, i64 %223, i64 %222)
	%226 = getelementptr i64, ptr %x, i64 0
	%227 = ptrtoint ptr %226 to i64
	%228 = inttoptr i64 %227 to ptr
	store i64 %225, ptr %228, align 8
	%229  = add i64 %225, 0; bloody hack
	store i64 %225, ptr %0, align 8
	%230 = load i64, ptr %x, align 8
	%231 = call i64 @genFetch(i64 %230)
	%232 = getelementptr i64, ptr %x, i64 0
	%233 = ptrtoint ptr %232 to i64
	%234 = inttoptr i64 %233 to ptr
	store i64 %231, ptr %234, align 8
	%235  = add i64 %231, 0; bloody hack
	store i64 %231, ptr %0, align 8
	%236 = load i64, ptr %x, align 8
	%237 = call i64 @genFetchByte(i64 %236)
	%238 = getelementptr i64, ptr %x, i64 0
	%239 = ptrtoint ptr %238 to i64
	%240 = inttoptr i64 %239 to ptr
	store i64 %237, ptr %240, align 8
	%241  = add i64 %237, 0; bloody hack
	store i64 %237, ptr %0, align 8
	%242 = load i64, ptr %y, align 8
	%243 = load i64, ptr %x, align 8
	%244 = call i64 @genStore(i64 %243, i64 %242)
	store i64 %244, ptr %0, align 8
	%245 = getelementptr i64, ptr @.STR243, i64 0
	%246 = ptrtoint ptr %245 to i64
	%247 = call i64 @UStrCreate(i64 %246)
	%248 = call i64 @genCallBegin(i64 %247)
	store i64 %248, ptr %0, align 8
	%249 = getelementptr i64, ptr @.STR244, i64 0
	%250 = ptrtoint ptr %249 to i64
	%251 = call i64 @UStrCreate(i64 %250)
	%252 = call i64 @genCallBegin(i64 %251)
	store i64 %252, ptr %0, align 8
	; load constant 0 into %253
	%253 = add i64 0, 0
	%254 = load i64, ptr %x, align 8
	%255 = call i64 @genCallAddArg(i64 %254, i64 %253)
	store i64 %255, ptr %0, align 8
	%256 = call i64 @genCallEnd()
	%257 = call i64 @genCallAddArg(i64 %256)
	store i64 %257, ptr %0, align 8
	%258 = call i64 @genCallEnd()
	store i64 %258, ptr %0, align 8
	%259 = call i64 @genGetTmp()
	%260 = getelementptr i64, ptr %x, i64 0
	%261 = ptrtoint ptr %260 to i64
	%262 = inttoptr i64 %261 to ptr
	store i64 %259, ptr %262, align 8
	%263  = add i64 %259, 0; bloody hack
	store i64 %259, ptr %0, align 8
	%264 = load i64, ptr %x, align 8
	; load constant 1 into %265
	%265 = add i64 1, 0
	%266 = call i64 @genSaveBoolInTmp(i64 %265, i64 %264)
	store i64 %266, ptr %0, align 8
	%267 = load i64, ptr %x, align 8
	; load constant 0 into %268
	%268 = add i64 0, 0
	%269 = call i64 @genSaveBoolInTmp(i64 %268, i64 %267)
	store i64 %269, ptr %0, align 8
	%270 = load i64, ptr %x, align 8
	%271 = call i64 @genLoadFromTmp(i64 %270)
	%272 = getelementptr i64, ptr %y, i64 0
	%273 = ptrtoint ptr %272 to i64
	%274 = inttoptr i64 %273 to ptr
	store i64 %271, ptr %274, align 8
	%275  = add i64 %271, 0; bloody hack
	store i64 %271, ptr %0, align 8
	%276 = call i64 @genFuncDefEnd()
	store i64 %276, ptr %0, align 8
	%277 = call i64 @symtabPrintGlobals()
	store i64 %277, ptr %0, align 8
	br label %.L584
.L584:
	%278= load i64, ptr %0, align 8
	ret i64 %278
}

@.STR244 = global [8 x i8] c"putchar\00", align 8
@.STR243 = global [8 x i8] c"putchar\00", align 8
@.STR242 = global [2 x i8] c"x\00", align 8
@.STR241 = global [2 x i8] c"x\00", align 8
@.STR240 = global [5 x i8] c"'\t'\00", align 8
@.STR239 = global [5 x i8] c"'\n'\00", align 8
@.STR238 = global [4 x i8] c"123\00", align 8
@.STR237 = global [2 x i8] c"x\00", align 8
@.STR236 = global [5 x i8] c"main\00", align 8
@.STR235 = global [2 x i8] c"c\00", align 8
@.STR234 = global [2 x i8] c"b\00", align 8
@.STR233 = global [2 x i8] c"a\00", align 8
@.STR232 = global [2 x i8] c"b\00", align 8
@.STR231 = global [2 x i8] c"a\00", align 8
@.STR230 = global [6 x i8] c"xfoox\00", align 8
; function createUnaryExpr
define i64 @createUnaryExpr(i64 %0, i64 %1) {
.L585:
	%kind = alloca i64, align 8
	store i64 %0, ptr %kind, align 8
	%child = alloca i64, align 8
	store i64 %1, ptr %child, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%n = alloca i64, align 8
	; load constant 32 into %3
	%3 = add i64 32, 0
	%4 = call i64 @malloc(i64 %3)
	%5 = getelementptr i64, ptr %n, i64 0
	%6 = ptrtoint ptr %5 to i64
	%7 = inttoptr i64 %6 to ptr
	store i64 %4, ptr %7, align 8
	%8  = add i64 %4, 0; bloody hack
	store i64 %4, ptr %2, align 8
	%9 = load i64, ptr %kind, align 8
	%10 = load i64, ptr %n, align 8
	; load constant 0 into %11
	%11 = add i64 0, 0
	%12 = add i64 %10, %11
	%13 = inttoptr i64 %12 to ptr
	store i64 %9, ptr %13, align 8
	%14  = add i64 %9, 0; bloody hack
	store i64 %9, ptr %2, align 8
	%15 = load i64, ptr %child, align 8
	%16 = load i64, ptr %n, align 8
	; load constant 8 into %17
	%17 = add i64 8, 0
	%18 = add i64 %16, %17
	%19 = inttoptr i64 %18 to ptr
	store i64 %15, ptr %19, align 8
	%20  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %2, align 8
	%21 = load i64, ptr %n, align 8
	store i64 %21, ptr %2, align 8
	br label %.L586
.L586:
	%22= load i64, ptr %2, align 8
	ret i64 %22
}

; function createBinaryExpr
define i64 @createBinaryExpr(i64 %0, i64 %1, i64 %2) {
.L587:
	%kind = alloca i64, align 8
	store i64 %0, ptr %kind, align 8
	%left = alloca i64, align 8
	store i64 %1, ptr %left, align 8
	%right = alloca i64, align 8
	store i64 %2, ptr %right, align 8
	%3 = alloca i64, align 8 ; ptr to ret val
	%n = alloca i64, align 8
	; load constant 32 into %4
	%4 = add i64 32, 0
	%5 = call i64 @malloc(i64 %4)
	%6 = getelementptr i64, ptr %n, i64 0
	%7 = ptrtoint ptr %6 to i64
	%8 = inttoptr i64 %7 to ptr
	store i64 %5, ptr %8, align 8
	%9  = add i64 %5, 0; bloody hack
	store i64 %5, ptr %3, align 8
	%10 = load i64, ptr %kind, align 8
	%11 = load i64, ptr %n, align 8
	; load constant 0 into %12
	%12 = add i64 0, 0
	%13 = add i64 %11, %12
	%14 = inttoptr i64 %13 to ptr
	store i64 %10, ptr %14, align 8
	%15  = add i64 %10, 0; bloody hack
	store i64 %10, ptr %3, align 8
	%16 = load i64, ptr %left, align 8
	%17 = load i64, ptr %n, align 8
	; load constant 8 into %18
	%18 = add i64 8, 0
	%19 = add i64 %17, %18
	%20 = inttoptr i64 %19 to ptr
	store i64 %16, ptr %20, align 8
	%21  = add i64 %16, 0; bloody hack
	store i64 %16, ptr %3, align 8
	%22 = load i64, ptr %right, align 8
	%23 = load i64, ptr %n, align 8
	; load constant 16 into %24
	%24 = add i64 16, 0
	%25 = add i64 %23, %24
	%26 = inttoptr i64 %25 to ptr
	store i64 %22, ptr %26, align 8
	%27  = add i64 %22, 0; bloody hack
	store i64 %22, ptr %3, align 8
	%28 = load i64, ptr %n, align 8
	store i64 %28, ptr %3, align 8
	br label %.L588
.L588:
	%29= load i64, ptr %3, align 8
	ret i64 %29
}

; function createIntegerExpr
define i64 @createIntegerExpr(i64 %0) {
.L589:
	%val = alloca i64, align 8
	store i64 %0, ptr %val, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%n = alloca i64, align 8
	; load constant 32 into %2
	%2 = add i64 32, 0
	%3 = call i64 @malloc(i64 %2)
	%4 = getelementptr i64, ptr %n, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %1, align 8
	; load constant 17 into %8
	%8 = add i64 17, 0
	%9 = load i64, ptr %n, align 8
	; load constant 0 into %10
	%10 = add i64 0, 0
	%11 = add i64 %9, %10
	%12 = inttoptr i64 %11 to ptr
	store i64 %8, ptr %12, align 8
	%13  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %1, align 8
	%14 = load i64, ptr %val, align 8
	%15 = load i64, ptr %n, align 8
	; load constant 8 into %16
	%16 = add i64 8, 0
	%17 = add i64 %15, %16
	%18 = inttoptr i64 %17 to ptr
	store i64 %14, ptr %18, align 8
	%19  = add i64 %14, 0; bloody hack
	store i64 %14, ptr %1, align 8
	%20 = load i64, ptr %n, align 8
	store i64 %20, ptr %1, align 8
	br label %.L590
.L590:
	%21= load i64, ptr %1, align 8
	ret i64 %21
}

; function createIdentifierExpr
define i64 @createIdentifierExpr(i64 %0) {
.L591:
	%val = alloca i64, align 8
	store i64 %0, ptr %val, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%n = alloca i64, align 8
	; load constant 32 into %2
	%2 = add i64 32, 0
	%3 = call i64 @malloc(i64 %2)
	%4 = getelementptr i64, ptr %n, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %1, align 8
	; load constant 18 into %8
	%8 = add i64 18, 0
	%9 = load i64, ptr %n, align 8
	; load constant 0 into %10
	%10 = add i64 0, 0
	%11 = add i64 %9, %10
	%12 = inttoptr i64 %11 to ptr
	store i64 %8, ptr %12, align 8
	%13  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %1, align 8
	%14 = load i64, ptr %val, align 8
	%15 = load i64, ptr %n, align 8
	; load constant 8 into %16
	%16 = add i64 8, 0
	%17 = add i64 %15, %16
	%18 = inttoptr i64 %17 to ptr
	store i64 %14, ptr %18, align 8
	%19  = add i64 %14, 0; bloody hack
	store i64 %14, ptr %1, align 8
	%20 = load i64, ptr %n, align 8
	store i64 %20, ptr %1, align 8
	br label %.L592
.L592:
	%21= load i64, ptr %1, align 8
	ret i64 %21
}

; function createCallExpr
define i64 @createCallExpr(i64 %0) {
.L593:
	%fnName = alloca i64, align 8
	store i64 %0, ptr %fnName, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%n = alloca i64, align 8
	; load constant 32 into %2
	%2 = add i64 32, 0
	%3 = call i64 @malloc(i64 %2)
	%4 = getelementptr i64, ptr %n, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %1, align 8
	; load constant 19 into %8
	%8 = add i64 19, 0
	%9 = load i64, ptr %n, align 8
	; load constant 0 into %10
	%10 = add i64 0, 0
	%11 = add i64 %9, %10
	%12 = inttoptr i64 %11 to ptr
	store i64 %8, ptr %12, align 8
	%13  = add i64 %8, 0; bloody hack
	store i64 %8, ptr %1, align 8
	%14 = load i64, ptr %fnName, align 8
	%15 = load i64, ptr %n, align 8
	; load constant 8 into %16
	%16 = add i64 8, 0
	%17 = add i64 %15, %16
	%18 = inttoptr i64 %17 to ptr
	store i64 %14, ptr %18, align 8
	%19  = add i64 %14, 0; bloody hack
	store i64 %14, ptr %1, align 8
	; load constant 0 into %20
	%20 = add i64 0, 0
	%21 = load i64, ptr %n, align 8
	; load constant 16 into %22
	%22 = add i64 16, 0
	%23 = add i64 %21, %22
	%24 = inttoptr i64 %23 to ptr
	store i64 %20, ptr %24, align 8
	%25  = add i64 %20, 0; bloody hack
	store i64 %20, ptr %1, align 8
	; load constant 0 into %26
	%26 = add i64 0, 0
	%27 = load i64, ptr %n, align 8
	; load constant 24 into %28
	%28 = add i64 24, 0
	%29 = add i64 %27, %28
	%30 = inttoptr i64 %29 to ptr
	store i64 %26, ptr %30, align 8
	%31  = add i64 %26, 0; bloody hack
	store i64 %26, ptr %1, align 8
	%32 = load i64, ptr %n, align 8
	store i64 %32, ptr %1, align 8
	br label %.L594
.L594:
	%33= load i64, ptr %1, align 8
	ret i64 %33
}

; function addArgExpr
define i64 @addArgExpr(i64 %0, i64 %1) {
.L595:
	%callExpr = alloca i64, align 8
	store i64 %0, ptr %callExpr, align 8
	%argExpr = alloca i64, align 8
	store i64 %1, ptr %argExpr, align 8
	%2 = alloca i64, align 8 ; ptr to ret val
	%n = alloca i64, align 8
	; load constant 32 into %3
	%3 = add i64 32, 0
	%4 = call i64 @malloc(i64 %3)
	%5 = getelementptr i64, ptr %n, i64 0
	%6 = ptrtoint ptr %5 to i64
	%7 = inttoptr i64 %6 to ptr
	store i64 %4, ptr %7, align 8
	%8  = add i64 %4, 0; bloody hack
	store i64 %4, ptr %2, align 8
	; load constant 20 into %9
	%9 = add i64 20, 0
	%10 = load i64, ptr %n, align 8
	; load constant 0 into %11
	%11 = add i64 0, 0
	%12 = add i64 %10, %11
	%13 = inttoptr i64 %12 to ptr
	store i64 %9, ptr %13, align 8
	%14  = add i64 %9, 0; bloody hack
	store i64 %9, ptr %2, align 8
	%15 = load i64, ptr %callExpr, align 8
	; load constant 24 into %16
	%16 = add i64 24, 0
	%17 = add i64 %15, %16
	%18 = inttoptr i64 %17 to ptr
	%19 = load i64, ptr %18, align 8
	%20 = load i64, ptr %n, align 8
	; load constant 8 into %21
	%21 = add i64 8, 0
	%22 = add i64 %20, %21
	%23 = inttoptr i64 %22 to ptr
	store i64 %19, ptr %23, align 8
	%24  = add i64 %19, 0; bloody hack
	store i64 %19, ptr %2, align 8
	%25 = load i64, ptr %argExpr, align 8
	%26 = load i64, ptr %n, align 8
	; load constant 16 into %27
	%27 = add i64 16, 0
	%28 = add i64 %26, %27
	%29 = inttoptr i64 %28 to ptr
	store i64 %25, ptr %29, align 8
	%30  = add i64 %25, 0; bloody hack
	store i64 %25, ptr %2, align 8
	%31 = load i64, ptr %callExpr, align 8
	; load constant 16 into %32
	%32 = add i64 16, 0
	%33 = add i64 %31, %32
	%34 = inttoptr i64 %33 to ptr
	%35 = load i64, ptr %34, align 8
	%36 = load i64, ptr %n, align 8
	; load constant 24 into %37
	%37 = add i64 24, 0
	%38 = add i64 %36, %37
	%39 = inttoptr i64 %38 to ptr
	store i64 %35, ptr %39, align 8
	%40  = add i64 %35, 0; bloody hack
	store i64 %35, ptr %2, align 8
	%41 = load i64, ptr %callExpr, align 8
	; load constant 16 into %42
	%42 = add i64 16, 0
	%43 = add i64 %41, %42
	%44 = inttoptr i64 %43 to ptr
	%45 = load i64, ptr %44, align 8
	; load constant 1 into %46
	%46 = add i64 1, 0
	%47 = add i64 %45, %46
	%48 = load i64, ptr %callExpr, align 8
	; load constant 16 into %49
	%49 = add i64 16, 0
	%50 = add i64 %48, %49
	%51 = inttoptr i64 %50 to ptr
	store i64 %47, ptr %51, align 8
	%52  = add i64 %47, 0; bloody hack
	store i64 %47, ptr %2, align 8
	%53 = load i64, ptr %n, align 8
	%54 = load i64, ptr %callExpr, align 8
	; load constant 24 into %55
	%55 = add i64 24, 0
	%56 = add i64 %54, %55
	%57 = inttoptr i64 %56 to ptr
	store i64 %53, ptr %57, align 8
	%58  = add i64 %53, 0; bloody hack
	store i64 %53, ptr %2, align 8
	br label %.L596
.L596:
	%59= load i64, ptr %2, align 8
	ret i64 %59
}

; function releaseExpr
define i64 @releaseExpr(i64 %0) {
.L597:
	%expr = alloca i64, align 8
	store i64 %0, ptr %expr, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = load i64, ptr %expr, align 8
	; load constant 0 into %3
	%3 = add i64 0, 0
	%4 = icmp eq i64 %2, %3
	%5 = zext i1 %4 to i64
	%6 = sub i64 %5, 0
	%7 = icmp eq i64 %6, 0
	br i1 %7, label %.L599, label %.L600
.L600:
	br label %.L598
.L599:
	%.TMP20 = alloca i64, align 8
	%8 = load i64, ptr %expr, align 8
	%9 = inttoptr i64 %8 to ptr
	%10 = load i64, ptr %9, align 8
	; load constant 0 into %11
	%11 = add i64 0, 0
	%12 = icmp sge i64 %10, %11
	%13 = zext i1 %12 to i64
	%14 = sub i64 %13, 0
	%15 = icmp ne i64 %14, 0
	br i1 %15, label %.L604, label %.L606
.L606:
	%16 = getelementptr i64, ptr %.TMP20, i64 0
	%17 = ptrtoint ptr %16 to i64
	; load constant 0 into %18
	%18 = add i64 0, 0
	%19 = inttoptr i64 %17 to ptr
	store i64 %18, ptr %19, align 8
	%20  = add i64 %18, 0; bloody hack
	; jump to end
	br label %.L603
.L604:
	%21 = load i64, ptr %expr, align 8
	%22 = inttoptr i64 %21 to ptr
	%23 = load i64, ptr %22, align 8
	; load constant 3 into %24
	%24 = add i64 3, 0
	%25 = icmp slt i64 %23, %24
	%26 = zext i1 %25 to i64
	%27 = sub i64 %26, 0
	%28 = icmp ne i64 %27, 0
	br i1 %28, label %.L605, label %.L607
.L607:
	%29 = getelementptr i64, ptr %.TMP20, i64 0
	%30 = ptrtoint ptr %29 to i64
	; load constant 0 into %31
	%31 = add i64 0, 0
	%32 = inttoptr i64 %30 to ptr
	store i64 %31, ptr %32, align 8
	%33  = add i64 %31, 0; bloody hack
	; jump to end
	br label %.L603
.L605:
	%34 = getelementptr i64, ptr %.TMP20, i64 0
	%35 = ptrtoint ptr %34 to i64
	; load constant 1 into %36
	%36 = add i64 1, 0
	%37 = inttoptr i64 %35 to ptr
	store i64 %36, ptr %37, align 8
	%38  = add i64 %36, 0; bloody hack
	br label %.L603
.L603:
	%39 = getelementptr i64, ptr %.TMP20, i64 0
	%40 = ptrtoint ptr %39 to i64
	%41 = inttoptr i64 %40 to ptr
	%42 = load i64, ptr %41, align 8
	%43 = sub i64 %42, 0
	%44 = icmp eq i64 %43, 0
	br i1 %44, label %.L602, label %.L608
.L608:
	%45 = load i64, ptr %expr, align 8
	; load constant 8 into %46
	%46 = add i64 8, 0
	%47 = add i64 %45, %46
	%48 = inttoptr i64 %47 to ptr
	%49 = load i64, ptr %48, align 8
	%50 = call i64 @releaseExpr(i64 %49)
	store i64 %50, ptr %1, align 8
	br label %.L601
.L602:
	%.TMP21 = alloca i64, align 8
	%51 = load i64, ptr %expr, align 8
	%52 = inttoptr i64 %51 to ptr
	%53 = load i64, ptr %52, align 8
	; load constant 3 into %54
	%54 = add i64 3, 0
	%55 = icmp sge i64 %53, %54
	%56 = zext i1 %55 to i64
	%57 = sub i64 %56, 0
	%58 = icmp ne i64 %57, 0
	br i1 %58, label %.L612, label %.L614
.L614:
	%59 = getelementptr i64, ptr %.TMP21, i64 0
	%60 = ptrtoint ptr %59 to i64
	; load constant 0 into %61
	%61 = add i64 0, 0
	%62 = inttoptr i64 %60 to ptr
	store i64 %61, ptr %62, align 8
	%63  = add i64 %61, 0; bloody hack
	; jump to end
	br label %.L611
.L612:
	%64 = load i64, ptr %expr, align 8
	%65 = inttoptr i64 %64 to ptr
	%66 = load i64, ptr %65, align 8
	; load constant 17 into %67
	%67 = add i64 17, 0
	%68 = icmp slt i64 %66, %67
	%69 = zext i1 %68 to i64
	%70 = sub i64 %69, 0
	%71 = icmp ne i64 %70, 0
	br i1 %71, label %.L613, label %.L615
.L615:
	%72 = getelementptr i64, ptr %.TMP21, i64 0
	%73 = ptrtoint ptr %72 to i64
	; load constant 0 into %74
	%74 = add i64 0, 0
	%75 = inttoptr i64 %73 to ptr
	store i64 %74, ptr %75, align 8
	%76  = add i64 %74, 0; bloody hack
	; jump to end
	br label %.L611
.L613:
	%77 = getelementptr i64, ptr %.TMP21, i64 0
	%78 = ptrtoint ptr %77 to i64
	; load constant 1 into %79
	%79 = add i64 1, 0
	%80 = inttoptr i64 %78 to ptr
	store i64 %79, ptr %80, align 8
	%81  = add i64 %79, 0; bloody hack
	br label %.L611
.L611:
	%82 = getelementptr i64, ptr %.TMP21, i64 0
	%83 = ptrtoint ptr %82 to i64
	%84 = inttoptr i64 %83 to ptr
	%85 = load i64, ptr %84, align 8
	%86 = sub i64 %85, 0
	%87 = icmp eq i64 %86, 0
	br i1 %87, label %.L610, label %.L616
.L616:
	%88 = load i64, ptr %expr, align 8
	; load constant 8 into %89
	%89 = add i64 8, 0
	%90 = add i64 %88, %89
	%91 = inttoptr i64 %90 to ptr
	%92 = load i64, ptr %91, align 8
	%93 = call i64 @releaseExpr(i64 %92)
	store i64 %93, ptr %1, align 8
	%94 = load i64, ptr %expr, align 8
	; load constant 16 into %95
	%95 = add i64 16, 0
	%96 = add i64 %94, %95
	%97 = inttoptr i64 %96 to ptr
	%98 = load i64, ptr %97, align 8
	%99 = call i64 @releaseExpr(i64 %98)
	store i64 %99, ptr %1, align 8
	br label %.L609
.L610:
	%100 = load i64, ptr %expr, align 8
	%101 = inttoptr i64 %100 to ptr
	%102 = load i64, ptr %101, align 8
	; load constant 19 into %103
	%103 = add i64 19, 0
	%104 = icmp eq i64 %102, %103
	%105 = zext i1 %104 to i64
	%106 = sub i64 %105, 0
	%107 = icmp eq i64 %106, 0
	br i1 %107, label %.L618, label %.L619
.L619:
	%108 = load i64, ptr %expr, align 8
	; load constant 24 into %109
	%109 = add i64 24, 0
	%110 = add i64 %108, %109
	%111 = inttoptr i64 %110 to ptr
	%112 = load i64, ptr %111, align 8
	%113 = call i64 @releaseExpr(i64 %112)
	store i64 %113, ptr %1, align 8
	br label %.L617
.L618:
	%114 = load i64, ptr %expr, align 8
	%115 = inttoptr i64 %114 to ptr
	%116 = load i64, ptr %115, align 8
	; load constant 20 into %117
	%117 = add i64 20, 0
	%118 = icmp eq i64 %116, %117
	%119 = zext i1 %118 to i64
	%120 = sub i64 %119, 0
	%121 = icmp eq i64 %120, 0
	br i1 %121, label %.L621, label %.L622
.L622:
	%122 = load i64, ptr %expr, align 8
	; load constant 16 into %123
	%123 = add i64 16, 0
	%124 = add i64 %122, %123
	%125 = inttoptr i64 %124 to ptr
	%126 = load i64, ptr %125, align 8
	%127 = call i64 @releaseExpr(i64 %126)
	store i64 %127, ptr %1, align 8
	%128 = load i64, ptr %expr, align 8
	; load constant 8 into %129
	%129 = add i64 8, 0
	%130 = add i64 %128, %129
	%131 = inttoptr i64 %130 to ptr
	%132 = load i64, ptr %131, align 8
	%133 = call i64 @releaseExpr(i64 %132)
	store i64 %133, ptr %1, align 8
	br label %.L620
.L621:
	br label %.L620
.L620:
	br label %.L617
.L617:
	br label %.L609
.L609:
	br label %.L601
.L601:
	br label %.L598
.L598:
	%134 = load i64, ptr %expr, align 8
	%135 = call i64 @free(i64 %134)
	store i64 %135, ptr %1, align 8
	br label %.L623
.L623:
	%136= load i64, ptr %1, align 8
	ret i64 %136
}

; function printExprTree
define i64 @printExprTree(i64 %0) {
.L624:
	%expr = alloca i64, align 8
	store i64 %0, ptr %expr, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = load i64, ptr %expr, align 8
	; load constant 0 into %3
	%3 = add i64 0, 0
	%4 = icmp eq i64 %2, %3
	%5 = zext i1 %4 to i64
	%6 = sub i64 %5, 0
	%7 = icmp eq i64 %6, 0
	br i1 %7, label %.L626, label %.L627
.L627:
	br label %.L625
.L626:
	%.TMP22 = alloca i64, align 8
	%8 = load i64, ptr %expr, align 8
	%9 = inttoptr i64 %8 to ptr
	%10 = load i64, ptr %9, align 8
	; load constant 0 into %11
	%11 = add i64 0, 0
	%12 = icmp sge i64 %10, %11
	%13 = zext i1 %12 to i64
	%14 = sub i64 %13, 0
	%15 = icmp ne i64 %14, 0
	br i1 %15, label %.L631, label %.L633
.L633:
	%16 = getelementptr i64, ptr %.TMP22, i64 0
	%17 = ptrtoint ptr %16 to i64
	; load constant 0 into %18
	%18 = add i64 0, 0
	%19 = inttoptr i64 %17 to ptr
	store i64 %18, ptr %19, align 8
	%20  = add i64 %18, 0; bloody hack
	; jump to end
	br label %.L630
.L631:
	%21 = load i64, ptr %expr, align 8
	%22 = inttoptr i64 %21 to ptr
	%23 = load i64, ptr %22, align 8
	; load constant 3 into %24
	%24 = add i64 3, 0
	%25 = icmp slt i64 %23, %24
	%26 = zext i1 %25 to i64
	%27 = sub i64 %26, 0
	%28 = icmp ne i64 %27, 0
	br i1 %28, label %.L632, label %.L634
.L634:
	%29 = getelementptr i64, ptr %.TMP22, i64 0
	%30 = ptrtoint ptr %29 to i64
	; load constant 0 into %31
	%31 = add i64 0, 0
	%32 = inttoptr i64 %30 to ptr
	store i64 %31, ptr %32, align 8
	%33  = add i64 %31, 0; bloody hack
	; jump to end
	br label %.L630
.L632:
	%34 = getelementptr i64, ptr %.TMP22, i64 0
	%35 = ptrtoint ptr %34 to i64
	; load constant 1 into %36
	%36 = add i64 1, 0
	%37 = inttoptr i64 %35 to ptr
	store i64 %36, ptr %37, align 8
	%38  = add i64 %36, 0; bloody hack
	br label %.L630
.L630:
	%39 = getelementptr i64, ptr %.TMP22, i64 0
	%40 = ptrtoint ptr %39 to i64
	%41 = inttoptr i64 %40 to ptr
	%42 = load i64, ptr %41, align 8
	%43 = sub i64 %42, 0
	%44 = icmp eq i64 %43, 0
	br i1 %44, label %.L629, label %.L635
.L635:
	%45 = getelementptr i64, ptr @.STR245, i64 0
	%46 = ptrtoint ptr %45 to i64
	%47 = call i64 @print(i64 %46)
	store i64 %47, ptr %1, align 8
	%48 = load i64, ptr %expr, align 8
	%49 = inttoptr i64 %48 to ptr
	%50 = load i64, ptr %49, align 8
	; load constant 0 into %51
	%51 = add i64 0, 0
	%52 = icmp eq i64 %50, %51
	%53 = zext i1 %52 to i64
	%54 = sub i64 %53, 0
	%55 = icmp eq i64 %54, 0
	br i1 %55, label %.L637, label %.L638
.L638:
	%56 = getelementptr i64, ptr @.STR246, i64 0
	%57 = ptrtoint ptr %56 to i64
	%58 = call i64 @print(i64 %57)
	store i64 %58, ptr %1, align 8
	br label %.L636
.L637:
	%59 = load i64, ptr %expr, align 8
	%60 = inttoptr i64 %59 to ptr
	%61 = load i64, ptr %60, align 8
	; load constant 1 into %62
	%62 = add i64 1, 0
	%63 = icmp eq i64 %61, %62
	%64 = zext i1 %63 to i64
	%65 = sub i64 %64, 0
	%66 = icmp eq i64 %65, 0
	br i1 %66, label %.L640, label %.L641
.L641:
	%67 = getelementptr i64, ptr @.STR247, i64 0
	%68 = ptrtoint ptr %67 to i64
	%69 = call i64 @print(i64 %68)
	store i64 %69, ptr %1, align 8
	br label %.L639
.L640:
	%70 = load i64, ptr %expr, align 8
	%71 = inttoptr i64 %70 to ptr
	%72 = load i64, ptr %71, align 8
	; load constant 2 into %73
	%73 = add i64 2, 0
	%74 = icmp eq i64 %72, %73
	%75 = zext i1 %74 to i64
	%76 = sub i64 %75, 0
	%77 = icmp eq i64 %76, 0
	br i1 %77, label %.L643, label %.L644
.L644:
	%78 = getelementptr i64, ptr @.STR248, i64 0
	%79 = ptrtoint ptr %78 to i64
	%80 = call i64 @print(i64 %79)
	store i64 %80, ptr %1, align 8
	br label %.L642
.L643:
	%81 = getelementptr i64, ptr @.STR249, i64 0
	%82 = ptrtoint ptr %81 to i64
	%83 = call i64 @println(i64 %82)
	store i64 %83, ptr %1, align 8
	br label %.L642
.L642:
	br label %.L639
.L639:
	br label %.L636
.L636:
	%84 = load i64, ptr %expr, align 8
	; load constant 8 into %85
	%85 = add i64 8, 0
	%86 = add i64 %84, %85
	%87 = inttoptr i64 %86 to ptr
	%88 = load i64, ptr %87, align 8
	%89 = call i64 @printExprTree(i64 %88)
	store i64 %89, ptr %1, align 8
	%90 = getelementptr i64, ptr @.STR250, i64 0
	%91 = ptrtoint ptr %90 to i64
	%92 = call i64 @print(i64 %91)
	store i64 %92, ptr %1, align 8
	br label %.L628
.L629:
	%.TMP23 = alloca i64, align 8
	%93 = load i64, ptr %expr, align 8
	%94 = inttoptr i64 %93 to ptr
	%95 = load i64, ptr %94, align 8
	; load constant 17 into %96
	%96 = add i64 17, 0
	%97 = icmp sge i64 %95, %96
	%98 = zext i1 %97 to i64
	%99 = sub i64 %98, 0
	%100 = icmp ne i64 %99, 0
	br i1 %100, label %.L648, label %.L650
.L650:
	%101 = getelementptr i64, ptr %.TMP23, i64 0
	%102 = ptrtoint ptr %101 to i64
	; load constant 0 into %103
	%103 = add i64 0, 0
	%104 = inttoptr i64 %102 to ptr
	store i64 %103, ptr %104, align 8
	%105  = add i64 %103, 0; bloody hack
	; jump to end
	br label %.L647
.L648:
	%106 = load i64, ptr %expr, align 8
	%107 = inttoptr i64 %106 to ptr
	%108 = load i64, ptr %107, align 8
	; load constant 20 into %109
	%109 = add i64 20, 0
	%110 = icmp slt i64 %108, %109
	%111 = zext i1 %110 to i64
	%112 = sub i64 %111, 0
	%113 = icmp ne i64 %112, 0
	br i1 %113, label %.L649, label %.L651
.L651:
	%114 = getelementptr i64, ptr %.TMP23, i64 0
	%115 = ptrtoint ptr %114 to i64
	; load constant 0 into %116
	%116 = add i64 0, 0
	%117 = inttoptr i64 %115 to ptr
	store i64 %116, ptr %117, align 8
	%118  = add i64 %116, 0; bloody hack
	; jump to end
	br label %.L647
.L649:
	%119 = getelementptr i64, ptr %.TMP23, i64 0
	%120 = ptrtoint ptr %119 to i64
	; load constant 1 into %121
	%121 = add i64 1, 0
	%122 = inttoptr i64 %120 to ptr
	store i64 %121, ptr %122, align 8
	%123  = add i64 %121, 0; bloody hack
	br label %.L647
.L647:
	%124 = getelementptr i64, ptr %.TMP23, i64 0
	%125 = ptrtoint ptr %124 to i64
	%126 = inttoptr i64 %125 to ptr
	%127 = load i64, ptr %126, align 8
	%128 = sub i64 %127, 0
	%129 = icmp eq i64 %128, 0
	br i1 %129, label %.L646, label %.L652
.L652:
	%.TMP24 = alloca i64, align 8
	%130 = load i64, ptr %expr, align 8
	%131 = inttoptr i64 %130 to ptr
	%132 = load i64, ptr %131, align 8
	; load constant 17 into %133
	%133 = add i64 17, 0
	%134 = icmp eq i64 %132, %133
	%135 = zext i1 %134 to i64
	%136 = sub i64 %135, 0
	%137 = icmp eq i64 %136, 0
	br i1 %137, label %.L656, label %.L658
.L658:
	%138 = getelementptr i64, ptr %.TMP24, i64 0
	%139 = ptrtoint ptr %138 to i64
	; load constant 1 into %140
	%140 = add i64 1, 0
	%141 = inttoptr i64 %139 to ptr
	store i64 %140, ptr %141, align 8
	%142  = add i64 %140, 0; bloody hack
	br label %.L655
.L656:
	%143 = load i64, ptr %expr, align 8
	%144 = inttoptr i64 %143 to ptr
	%145 = load i64, ptr %144, align 8
	; load constant 18 into %146
	%146 = add i64 18, 0
	%147 = icmp eq i64 %145, %146
	%148 = zext i1 %147 to i64
	%149 = sub i64 %148, 0
	%150 = icmp ne i64 %149, 0
	br i1 %150, label %.L657, label %.L659
.L659:
	%151 = getelementptr i64, ptr %.TMP24, i64 0
	%152 = ptrtoint ptr %151 to i64
	; load constant 0 into %153
	%153 = add i64 0, 0
	%154 = inttoptr i64 %152 to ptr
	store i64 %153, ptr %154, align 8
	%155  = add i64 %153, 0; bloody hack
	br label %.L655
.L657:
	%156 = getelementptr i64, ptr %.TMP24, i64 0
	%157 = ptrtoint ptr %156 to i64
	; load constant 1 into %158
	%158 = add i64 1, 0
	%159 = inttoptr i64 %157 to ptr
	store i64 %158, ptr %159, align 8
	%160  = add i64 %158, 0; bloody hack
	br label %.L655
.L655:
	%161 = getelementptr i64, ptr %.TMP24, i64 0
	%162 = ptrtoint ptr %161 to i64
	%163 = inttoptr i64 %162 to ptr
	%164 = load i64, ptr %163, align 8
	%165 = sub i64 %164, 0
	%166 = icmp eq i64 %165, 0
	br i1 %166, label %.L654, label %.L660
.L660:
	%167 = getelementptr i64, ptr @.STR251, i64 0
	%168 = ptrtoint ptr %167 to i64
	%169 = call i64 @print(i64 %168)
	store i64 %169, ptr %1, align 8
	%170 = load i64, ptr %expr, align 8
	; load constant 8 into %171
	%171 = add i64 8, 0
	%172 = add i64 %170, %171
	%173 = inttoptr i64 %172 to ptr
	%174 = load i64, ptr %173, align 8
	%175 = call i64 @print(i64 %174)
	store i64 %175, ptr %1, align 8
	%176 = getelementptr i64, ptr @.STR252, i64 0
	%177 = ptrtoint ptr %176 to i64
	%178 = call i64 @print(i64 %177)
	store i64 %178, ptr %1, align 8
	br label %.L653
.L654:
	%179 = load i64, ptr %expr, align 8
	%180 = inttoptr i64 %179 to ptr
	%181 = load i64, ptr %180, align 8
	; load constant 19 into %182
	%182 = add i64 19, 0
	%183 = icmp eq i64 %181, %182
	%184 = zext i1 %183 to i64
	%185 = sub i64 %184, 0
	%186 = icmp eq i64 %185, 0
	br i1 %186, label %.L662, label %.L663
.L663:
	%187 = getelementptr i64, ptr @.STR253, i64 0
	%188 = ptrtoint ptr %187 to i64
	%189 = call i64 @print(i64 %188)
	store i64 %189, ptr %1, align 8
	%190 = load i64, ptr %expr, align 8
	; load constant 8 into %191
	%191 = add i64 8, 0
	%192 = add i64 %190, %191
	%193 = inttoptr i64 %192 to ptr
	%194 = load i64, ptr %193, align 8
	%195 = call i64 @print(i64 %194)
	store i64 %195, ptr %1, align 8
	%196 = load i64, ptr %expr, align 8
	; load constant 24 into %197
	%197 = add i64 24, 0
	%198 = add i64 %196, %197
	%199 = inttoptr i64 %198 to ptr
	%200 = load i64, ptr %199, align 8
	%201 = call i64 @printExprTree(i64 %200)
	store i64 %201, ptr %1, align 8
	%202 = getelementptr i64, ptr @.STR254, i64 0
	%203 = ptrtoint ptr %202 to i64
	%204 = call i64 @print(i64 %203)
	store i64 %204, ptr %1, align 8
	br label %.L661
.L662:
	%205 = getelementptr i64, ptr @.STR255, i64 0
	%206 = ptrtoint ptr %205 to i64
	%207 = call i64 @println(i64 %206)
	store i64 %207, ptr %1, align 8
	br label %.L661
.L661:
	br label %.L653
.L653:
	br label %.L645
.L646:
	%.TMP25 = alloca i64, align 8
	%208 = load i64, ptr %expr, align 8
	%209 = inttoptr i64 %208 to ptr
	%210 = load i64, ptr %209, align 8
	; load constant 3 into %211
	%211 = add i64 3, 0
	%212 = icmp sge i64 %210, %211
	%213 = zext i1 %212 to i64
	%214 = sub i64 %213, 0
	%215 = icmp ne i64 %214, 0
	br i1 %215, label %.L667, label %.L669
.L669:
	%216 = getelementptr i64, ptr %.TMP25, i64 0
	%217 = ptrtoint ptr %216 to i64
	; load constant 0 into %218
	%218 = add i64 0, 0
	%219 = inttoptr i64 %217 to ptr
	store i64 %218, ptr %219, align 8
	%220  = add i64 %218, 0; bloody hack
	; jump to end
	br label %.L666
.L667:
	%221 = load i64, ptr %expr, align 8
	%222 = inttoptr i64 %221 to ptr
	%223 = load i64, ptr %222, align 8
	; load constant 17 into %224
	%224 = add i64 17, 0
	%225 = icmp slt i64 %223, %224
	%226 = zext i1 %225 to i64
	%227 = sub i64 %226, 0
	%228 = icmp ne i64 %227, 0
	br i1 %228, label %.L668, label %.L670
.L670:
	%229 = getelementptr i64, ptr %.TMP25, i64 0
	%230 = ptrtoint ptr %229 to i64
	; load constant 0 into %231
	%231 = add i64 0, 0
	%232 = inttoptr i64 %230 to ptr
	store i64 %231, ptr %232, align 8
	%233  = add i64 %231, 0; bloody hack
	; jump to end
	br label %.L666
.L668:
	%234 = getelementptr i64, ptr %.TMP25, i64 0
	%235 = ptrtoint ptr %234 to i64
	; load constant 1 into %236
	%236 = add i64 1, 0
	%237 = inttoptr i64 %235 to ptr
	store i64 %236, ptr %237, align 8
	%238  = add i64 %236, 0; bloody hack
	br label %.L666
.L666:
	%239 = getelementptr i64, ptr %.TMP25, i64 0
	%240 = ptrtoint ptr %239 to i64
	%241 = inttoptr i64 %240 to ptr
	%242 = load i64, ptr %241, align 8
	%243 = sub i64 %242, 0
	%244 = icmp eq i64 %243, 0
	br i1 %244, label %.L665, label %.L671
.L671:
	%245 = getelementptr i64, ptr @.STR256, i64 0
	%246 = ptrtoint ptr %245 to i64
	%247 = call i64 @print(i64 %246)
	store i64 %247, ptr %1, align 8
	%248 = load i64, ptr %expr, align 8
	%249 = inttoptr i64 %248 to ptr
	%250 = load i64, ptr %249, align 8
	; load constant 3 into %251
	%251 = add i64 3, 0
	%252 = icmp eq i64 %250, %251
	%253 = zext i1 %252 to i64
	%254 = sub i64 %253, 0
	%255 = icmp eq i64 %254, 0
	br i1 %255, label %.L673, label %.L674
.L674:
	%256 = getelementptr i64, ptr @.STR257, i64 0
	%257 = ptrtoint ptr %256 to i64
	%258 = call i64 @print(i64 %257)
	store i64 %258, ptr %1, align 8
	br label %.L672
.L673:
	%259 = load i64, ptr %expr, align 8
	%260 = inttoptr i64 %259 to ptr
	%261 = load i64, ptr %260, align 8
	; load constant 4 into %262
	%262 = add i64 4, 0
	%263 = icmp eq i64 %261, %262
	%264 = zext i1 %263 to i64
	%265 = sub i64 %264, 0
	%266 = icmp eq i64 %265, 0
	br i1 %266, label %.L676, label %.L677
.L677:
	%267 = getelementptr i64, ptr @.STR258, i64 0
	%268 = ptrtoint ptr %267 to i64
	%269 = call i64 @print(i64 %268)
	store i64 %269, ptr %1, align 8
	br label %.L675
.L676:
	%270 = load i64, ptr %expr, align 8
	%271 = inttoptr i64 %270 to ptr
	%272 = load i64, ptr %271, align 8
	; load constant 5 into %273
	%273 = add i64 5, 0
	%274 = icmp eq i64 %272, %273
	%275 = zext i1 %274 to i64
	%276 = sub i64 %275, 0
	%277 = icmp eq i64 %276, 0
	br i1 %277, label %.L679, label %.L680
.L680:
	%278 = getelementptr i64, ptr @.STR259, i64 0
	%279 = ptrtoint ptr %278 to i64
	%280 = call i64 @print(i64 %279)
	store i64 %280, ptr %1, align 8
	br label %.L678
.L679:
	%281 = load i64, ptr %expr, align 8
	%282 = inttoptr i64 %281 to ptr
	%283 = load i64, ptr %282, align 8
	; load constant 6 into %284
	%284 = add i64 6, 0
	%285 = icmp eq i64 %283, %284
	%286 = zext i1 %285 to i64
	%287 = sub i64 %286, 0
	%288 = icmp eq i64 %287, 0
	br i1 %288, label %.L682, label %.L683
.L683:
	%289 = getelementptr i64, ptr @.STR260, i64 0
	%290 = ptrtoint ptr %289 to i64
	%291 = call i64 @print(i64 %290)
	store i64 %291, ptr %1, align 8
	br label %.L681
.L682:
	%292 = load i64, ptr %expr, align 8
	%293 = inttoptr i64 %292 to ptr
	%294 = load i64, ptr %293, align 8
	; load constant 7 into %295
	%295 = add i64 7, 0
	%296 = icmp eq i64 %294, %295
	%297 = zext i1 %296 to i64
	%298 = sub i64 %297, 0
	%299 = icmp eq i64 %298, 0
	br i1 %299, label %.L685, label %.L686
.L686:
	%300 = getelementptr i64, ptr @.STR261, i64 0
	%301 = ptrtoint ptr %300 to i64
	%302 = call i64 @print(i64 %301)
	store i64 %302, ptr %1, align 8
	br label %.L684
.L685:
	%303 = load i64, ptr %expr, align 8
	%304 = inttoptr i64 %303 to ptr
	%305 = load i64, ptr %304, align 8
	; load constant 8 into %306
	%306 = add i64 8, 0
	%307 = icmp eq i64 %305, %306
	%308 = zext i1 %307 to i64
	%309 = sub i64 %308, 0
	%310 = icmp eq i64 %309, 0
	br i1 %310, label %.L688, label %.L689
.L689:
	%311 = getelementptr i64, ptr @.STR262, i64 0
	%312 = ptrtoint ptr %311 to i64
	%313 = call i64 @print(i64 %312)
	store i64 %313, ptr %1, align 8
	br label %.L687
.L688:
	%314 = load i64, ptr %expr, align 8
	%315 = inttoptr i64 %314 to ptr
	%316 = load i64, ptr %315, align 8
	; load constant 9 into %317
	%317 = add i64 9, 0
	%318 = icmp eq i64 %316, %317
	%319 = zext i1 %318 to i64
	%320 = sub i64 %319, 0
	%321 = icmp eq i64 %320, 0
	br i1 %321, label %.L691, label %.L692
.L692:
	%322 = getelementptr i64, ptr @.STR263, i64 0
	%323 = ptrtoint ptr %322 to i64
	%324 = call i64 @print(i64 %323)
	store i64 %324, ptr %1, align 8
	br label %.L690
.L691:
	%325 = load i64, ptr %expr, align 8
	%326 = inttoptr i64 %325 to ptr
	%327 = load i64, ptr %326, align 8
	; load constant 10 into %328
	%328 = add i64 10, 0
	%329 = icmp eq i64 %327, %328
	%330 = zext i1 %329 to i64
	%331 = sub i64 %330, 0
	%332 = icmp eq i64 %331, 0
	br i1 %332, label %.L694, label %.L695
.L695:
	%333 = getelementptr i64, ptr @.STR264, i64 0
	%334 = ptrtoint ptr %333 to i64
	%335 = call i64 @print(i64 %334)
	store i64 %335, ptr %1, align 8
	br label %.L693
.L694:
	%336 = load i64, ptr %expr, align 8
	%337 = inttoptr i64 %336 to ptr
	%338 = load i64, ptr %337, align 8
	; load constant 11 into %339
	%339 = add i64 11, 0
	%340 = icmp eq i64 %338, %339
	%341 = zext i1 %340 to i64
	%342 = sub i64 %341, 0
	%343 = icmp eq i64 %342, 0
	br i1 %343, label %.L697, label %.L698
.L698:
	%344 = getelementptr i64, ptr @.STR265, i64 0
	%345 = ptrtoint ptr %344 to i64
	%346 = call i64 @print(i64 %345)
	store i64 %346, ptr %1, align 8
	br label %.L696
.L697:
	%347 = load i64, ptr %expr, align 8
	%348 = inttoptr i64 %347 to ptr
	%349 = load i64, ptr %348, align 8
	; load constant 12 into %350
	%350 = add i64 12, 0
	%351 = icmp eq i64 %349, %350
	%352 = zext i1 %351 to i64
	%353 = sub i64 %352, 0
	%354 = icmp eq i64 %353, 0
	br i1 %354, label %.L700, label %.L701
.L701:
	%355 = getelementptr i64, ptr @.STR266, i64 0
	%356 = ptrtoint ptr %355 to i64
	%357 = call i64 @print(i64 %356)
	store i64 %357, ptr %1, align 8
	br label %.L699
.L700:
	%358 = load i64, ptr %expr, align 8
	%359 = inttoptr i64 %358 to ptr
	%360 = load i64, ptr %359, align 8
	; load constant 13 into %361
	%361 = add i64 13, 0
	%362 = icmp eq i64 %360, %361
	%363 = zext i1 %362 to i64
	%364 = sub i64 %363, 0
	%365 = icmp eq i64 %364, 0
	br i1 %365, label %.L703, label %.L704
.L704:
	%366 = getelementptr i64, ptr @.STR267, i64 0
	%367 = ptrtoint ptr %366 to i64
	%368 = call i64 @print(i64 %367)
	store i64 %368, ptr %1, align 8
	br label %.L702
.L703:
	%369 = load i64, ptr %expr, align 8
	%370 = inttoptr i64 %369 to ptr
	%371 = load i64, ptr %370, align 8
	; load constant 14 into %372
	%372 = add i64 14, 0
	%373 = icmp eq i64 %371, %372
	%374 = zext i1 %373 to i64
	%375 = sub i64 %374, 0
	%376 = icmp eq i64 %375, 0
	br i1 %376, label %.L706, label %.L707
.L707:
	%377 = getelementptr i64, ptr @.STR268, i64 0
	%378 = ptrtoint ptr %377 to i64
	%379 = call i64 @print(i64 %378)
	store i64 %379, ptr %1, align 8
	br label %.L705
.L706:
	%380 = load i64, ptr %expr, align 8
	%381 = inttoptr i64 %380 to ptr
	%382 = load i64, ptr %381, align 8
	; load constant 15 into %383
	%383 = add i64 15, 0
	%384 = icmp eq i64 %382, %383
	%385 = zext i1 %384 to i64
	%386 = sub i64 %385, 0
	%387 = icmp eq i64 %386, 0
	br i1 %387, label %.L709, label %.L710
.L710:
	%388 = getelementptr i64, ptr @.STR269, i64 0
	%389 = ptrtoint ptr %388 to i64
	%390 = call i64 @print(i64 %389)
	store i64 %390, ptr %1, align 8
	br label %.L708
.L709:
	%391 = load i64, ptr %expr, align 8
	%392 = inttoptr i64 %391 to ptr
	%393 = load i64, ptr %392, align 8
	; load constant 16 into %394
	%394 = add i64 16, 0
	%395 = icmp eq i64 %393, %394
	%396 = zext i1 %395 to i64
	%397 = sub i64 %396, 0
	%398 = icmp eq i64 %397, 0
	br i1 %398, label %.L712, label %.L713
.L713:
	%399 = getelementptr i64, ptr @.STR270, i64 0
	%400 = ptrtoint ptr %399 to i64
	%401 = call i64 @print(i64 %400)
	store i64 %401, ptr %1, align 8
	br label %.L711
.L712:
	%402 = getelementptr i64, ptr @.STR271, i64 0
	%403 = ptrtoint ptr %402 to i64
	%404 = call i64 @println(i64 %403)
	store i64 %404, ptr %1, align 8
	br label %.L711
.L711:
	br label %.L708
.L708:
	br label %.L705
.L705:
	br label %.L702
.L702:
	br label %.L699
.L699:
	br label %.L696
.L696:
	br label %.L693
.L693:
	br label %.L690
.L690:
	br label %.L687
.L687:
	br label %.L684
.L684:
	br label %.L681
.L681:
	br label %.L678
.L678:
	br label %.L675
.L675:
	br label %.L672
.L672:
	%405 = load i64, ptr %expr, align 8
	; load constant 8 into %406
	%406 = add i64 8, 0
	%407 = add i64 %405, %406
	%408 = inttoptr i64 %407 to ptr
	%409 = load i64, ptr %408, align 8
	%410 = call i64 @printExprTree(i64 %409)
	store i64 %410, ptr %1, align 8
	%411 = getelementptr i64, ptr @.STR272, i64 0
	%412 = ptrtoint ptr %411 to i64
	%413 = call i64 @print(i64 %412)
	store i64 %413, ptr %1, align 8
	%414 = load i64, ptr %expr, align 8
	; load constant 16 into %415
	%415 = add i64 16, 0
	%416 = add i64 %414, %415
	%417 = inttoptr i64 %416 to ptr
	%418 = load i64, ptr %417, align 8
	%419 = call i64 @printExprTree(i64 %418)
	store i64 %419, ptr %1, align 8
	%420 = getelementptr i64, ptr @.STR273, i64 0
	%421 = ptrtoint ptr %420 to i64
	%422 = call i64 @print(i64 %421)
	store i64 %422, ptr %1, align 8
	br label %.L664
.L665:
	%423 = load i64, ptr %expr, align 8
	%424 = inttoptr i64 %423 to ptr
	%425 = load i64, ptr %424, align 8
	; load constant 20 into %426
	%426 = add i64 20, 0
	%427 = icmp eq i64 %425, %426
	%428 = zext i1 %427 to i64
	%429 = sub i64 %428, 0
	%430 = icmp eq i64 %429, 0
	br i1 %430, label %.L715, label %.L716
.L716:
	%431 = load i64, ptr %expr, align 8
	; load constant 8 into %432
	%432 = add i64 8, 0
	%433 = add i64 %431, %432
	%434 = inttoptr i64 %433 to ptr
	%435 = load i64, ptr %434, align 8
	%436 = call i64 @printExprTree(i64 %435)
	store i64 %436, ptr %1, align 8
	%437 = load i64, ptr %expr, align 8
	; load constant 16 into %438
	%438 = add i64 16, 0
	%439 = add i64 %437, %438
	%440 = inttoptr i64 %439 to ptr
	%441 = load i64, ptr %440, align 8
	%442 = call i64 @printExprTree(i64 %441)
	store i64 %442, ptr %1, align 8
	br label %.L714
.L715:
	br label %.L714
.L714:
	br label %.L664
.L664:
	br label %.L645
.L645:
	br label %.L628
.L628:
	br label %.L625
.L625:
	br label %.L717
.L717:
	%443= load i64, ptr %1, align 8
	ret i64 %443
}

@.STR273 = global [3 x i8] c"] \00", align 8
@.STR272 = global [2 x i8] c" \00", align 8
@.STR271 = global [19 x i8] c"printExprTree_err2\00", align 8
@.STR270 = global [4 x i8] c"or \00", align 8
@.STR269 = global [5 x i8] c"and \00", align 8
@.STR268 = global [6 x i8] c">{=} \00", align 8
@.STR267 = global [3 x i8] c"> \00", align 8
@.STR266 = global [6 x i8] c"<{=} \00", align 8
@.STR265 = global [3 x i8] c"< \00", align 8
@.STR264 = global [8 x i8] c"{!}{=} \00", align 8
@.STR263 = global [8 x i8] c"{=}{=} \00", align 8
@.STR262 = global [5 x i8] c"mod \00", align 8
@.STR261 = global [5 x i8] c"{=} \00", align 8
@.STR260 = global [3 x i8] c"/ \00", align 8
@.STR259 = global [3 x i8] c"* \00", align 8
@.STR258 = global [3 x i8] c"- \00", align 8
@.STR257 = global [3 x i8] c"+ \00", align 8
@.STR256 = global [3 x i8] c"[ \00", align 8
@.STR255 = global [19 x i8] c"printExprTree_err1\00", align 8
@.STR254 = global [2 x i8] c"]\00", align 8
@.STR253 = global [7 x i8] c"[call \00", align 8
@.STR252 = global [2 x i8] c"]\00", align 8
@.STR251 = global [2 x i8] c"[\00", align 8
@.STR250 = global [3 x i8] c"] \00", align 8
@.STR249 = global [19 x i8] c"printExprTree_err0\00", align 8
@.STR248 = global [12 x i8] c"deref byte \00", align 8
@.STR247 = global [7 x i8] c"deref \00", align 8
@.STR246 = global [6 x i8] c"addr \00", align 8
@.STR245 = global [3 x i8] c"[ \00", align 8
; function genInstrFromExprKind
define i64 @genInstrFromExprKind(i64 %0) {
.L718:
	%exprKind = alloca i64, align 8
	store i64 %0, ptr %exprKind, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%genInstr = alloca i64, align 8
	; load constant 0 into %2
	%2 = add i64 0, 0
	; load constant 1 into %3
	%3 = add i64 1, 0
	%4 = sub i64 %2, %3
	%5 = getelementptr i64, ptr %genInstr, i64 0
	%6 = ptrtoint ptr %5 to i64
	%7 = inttoptr i64 %6 to ptr
	store i64 %4, ptr %7, align 8
	%8  = add i64 %4, 0; bloody hack
	store i64 %4, ptr %1, align 8
	%9 = load i64, ptr %exprKind, align 8
	; load constant 3 into %10
	%10 = add i64 3, 0
	%11 = icmp eq i64 %9, %10
	%12 = zext i1 %11 to i64
	%13 = sub i64 %12, 0
	%14 = icmp eq i64 %13, 0
	br i1 %14, label %.L720, label %.L721
.L721:
	; load constant 0 into %15
	%15 = add i64 0, 0
	%16 = getelementptr i64, ptr %genInstr, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = inttoptr i64 %17 to ptr
	store i64 %15, ptr %18, align 8
	%19  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %1, align 8
	br label %.L719
.L720:
	%20 = load i64, ptr %exprKind, align 8
	; load constant 4 into %21
	%21 = add i64 4, 0
	%22 = icmp eq i64 %20, %21
	%23 = zext i1 %22 to i64
	%24 = sub i64 %23, 0
	%25 = icmp eq i64 %24, 0
	br i1 %25, label %.L723, label %.L724
.L724:
	; load constant 1 into %26
	%26 = add i64 1, 0
	%27 = getelementptr i64, ptr %genInstr, i64 0
	%28 = ptrtoint ptr %27 to i64
	%29 = inttoptr i64 %28 to ptr
	store i64 %26, ptr %29, align 8
	%30  = add i64 %26, 0; bloody hack
	store i64 %26, ptr %1, align 8
	br label %.L722
.L723:
	%31 = load i64, ptr %exprKind, align 8
	; load constant 5 into %32
	%32 = add i64 5, 0
	%33 = icmp eq i64 %31, %32
	%34 = zext i1 %33 to i64
	%35 = sub i64 %34, 0
	%36 = icmp eq i64 %35, 0
	br i1 %36, label %.L726, label %.L727
.L727:
	; load constant 2 into %37
	%37 = add i64 2, 0
	%38 = getelementptr i64, ptr %genInstr, i64 0
	%39 = ptrtoint ptr %38 to i64
	%40 = inttoptr i64 %39 to ptr
	store i64 %37, ptr %40, align 8
	%41  = add i64 %37, 0; bloody hack
	store i64 %37, ptr %1, align 8
	br label %.L725
.L726:
	%42 = load i64, ptr %exprKind, align 8
	; load constant 6 into %43
	%43 = add i64 6, 0
	%44 = icmp eq i64 %42, %43
	%45 = zext i1 %44 to i64
	%46 = sub i64 %45, 0
	%47 = icmp eq i64 %46, 0
	br i1 %47, label %.L729, label %.L730
.L730:
	; load constant 3 into %48
	%48 = add i64 3, 0
	%49 = getelementptr i64, ptr %genInstr, i64 0
	%50 = ptrtoint ptr %49 to i64
	%51 = inttoptr i64 %50 to ptr
	store i64 %48, ptr %51, align 8
	%52  = add i64 %48, 0; bloody hack
	store i64 %48, ptr %1, align 8
	br label %.L728
.L729:
	%53 = load i64, ptr %exprKind, align 8
	; load constant 7 into %54
	%54 = add i64 7, 0
	%55 = icmp eq i64 %53, %54
	%56 = zext i1 %55 to i64
	%57 = sub i64 %56, 0
	%58 = icmp eq i64 %57, 0
	br i1 %58, label %.L732, label %.L733
.L733:
	%59 = getelementptr i64, ptr @.STR274, i64 0
	%60 = ptrtoint ptr %59 to i64
	%61 = call i64 @println(i64 %60)
	store i64 %61, ptr %1, align 8
	br label %.L731
.L732:
	%62 = load i64, ptr %exprKind, align 8
	; load constant 8 into %63
	%63 = add i64 8, 0
	%64 = icmp eq i64 %62, %63
	%65 = zext i1 %64 to i64
	%66 = sub i64 %65, 0
	%67 = icmp eq i64 %66, 0
	br i1 %67, label %.L735, label %.L736
.L736:
	; load constant 4 into %68
	%68 = add i64 4, 0
	%69 = getelementptr i64, ptr %genInstr, i64 0
	%70 = ptrtoint ptr %69 to i64
	%71 = inttoptr i64 %70 to ptr
	store i64 %68, ptr %71, align 8
	%72  = add i64 %68, 0; bloody hack
	store i64 %68, ptr %1, align 8
	br label %.L734
.L735:
	%73 = load i64, ptr %exprKind, align 8
	; load constant 9 into %74
	%74 = add i64 9, 0
	%75 = icmp eq i64 %73, %74
	%76 = zext i1 %75 to i64
	%77 = sub i64 %76, 0
	%78 = icmp eq i64 %77, 0
	br i1 %78, label %.L738, label %.L739
.L739:
	; load constant 5 into %79
	%79 = add i64 5, 0
	%80 = getelementptr i64, ptr %genInstr, i64 0
	%81 = ptrtoint ptr %80 to i64
	%82 = inttoptr i64 %81 to ptr
	store i64 %79, ptr %82, align 8
	%83  = add i64 %79, 0; bloody hack
	store i64 %79, ptr %1, align 8
	br label %.L737
.L738:
	%84 = load i64, ptr %exprKind, align 8
	; load constant 10 into %85
	%85 = add i64 10, 0
	%86 = icmp eq i64 %84, %85
	%87 = zext i1 %86 to i64
	%88 = sub i64 %87, 0
	%89 = icmp eq i64 %88, 0
	br i1 %89, label %.L741, label %.L742
.L742:
	; load constant 6 into %90
	%90 = add i64 6, 0
	%91 = getelementptr i64, ptr %genInstr, i64 0
	%92 = ptrtoint ptr %91 to i64
	%93 = inttoptr i64 %92 to ptr
	store i64 %90, ptr %93, align 8
	%94  = add i64 %90, 0; bloody hack
	store i64 %90, ptr %1, align 8
	br label %.L740
.L741:
	%95 = load i64, ptr %exprKind, align 8
	; load constant 11 into %96
	%96 = add i64 11, 0
	%97 = icmp eq i64 %95, %96
	%98 = zext i1 %97 to i64
	%99 = sub i64 %98, 0
	%100 = icmp eq i64 %99, 0
	br i1 %100, label %.L744, label %.L745
.L745:
	; load constant 8 into %101
	%101 = add i64 8, 0
	%102 = getelementptr i64, ptr %genInstr, i64 0
	%103 = ptrtoint ptr %102 to i64
	%104 = inttoptr i64 %103 to ptr
	store i64 %101, ptr %104, align 8
	%105  = add i64 %101, 0; bloody hack
	store i64 %101, ptr %1, align 8
	br label %.L743
.L744:
	%106 = load i64, ptr %exprKind, align 8
	; load constant 12 into %107
	%107 = add i64 12, 0
	%108 = icmp eq i64 %106, %107
	%109 = zext i1 %108 to i64
	%110 = sub i64 %109, 0
	%111 = icmp eq i64 %110, 0
	br i1 %111, label %.L747, label %.L748
.L748:
	; load constant 7 into %112
	%112 = add i64 7, 0
	%113 = getelementptr i64, ptr %genInstr, i64 0
	%114 = ptrtoint ptr %113 to i64
	%115 = inttoptr i64 %114 to ptr
	store i64 %112, ptr %115, align 8
	%116  = add i64 %112, 0; bloody hack
	store i64 %112, ptr %1, align 8
	br label %.L746
.L747:
	%117 = load i64, ptr %exprKind, align 8
	; load constant 13 into %118
	%118 = add i64 13, 0
	%119 = icmp eq i64 %117, %118
	%120 = zext i1 %119 to i64
	%121 = sub i64 %120, 0
	%122 = icmp eq i64 %121, 0
	br i1 %122, label %.L750, label %.L751
.L751:
	; load constant 10 into %123
	%123 = add i64 10, 0
	%124 = getelementptr i64, ptr %genInstr, i64 0
	%125 = ptrtoint ptr %124 to i64
	%126 = inttoptr i64 %125 to ptr
	store i64 %123, ptr %126, align 8
	%127  = add i64 %123, 0; bloody hack
	store i64 %123, ptr %1, align 8
	br label %.L749
.L750:
	%128 = load i64, ptr %exprKind, align 8
	; load constant 14 into %129
	%129 = add i64 14, 0
	%130 = icmp eq i64 %128, %129
	%131 = zext i1 %130 to i64
	%132 = sub i64 %131, 0
	%133 = icmp eq i64 %132, 0
	br i1 %133, label %.L753, label %.L754
.L754:
	; load constant 9 into %134
	%134 = add i64 9, 0
	%135 = getelementptr i64, ptr %genInstr, i64 0
	%136 = ptrtoint ptr %135 to i64
	%137 = inttoptr i64 %136 to ptr
	store i64 %134, ptr %137, align 8
	%138  = add i64 %134, 0; bloody hack
	store i64 %134, ptr %1, align 8
	br label %.L752
.L753:
	%139 = load i64, ptr %exprKind, align 8
	; load constant 15 into %140
	%140 = add i64 15, 0
	%141 = icmp eq i64 %139, %140
	%142 = zext i1 %141 to i64
	%143 = sub i64 %142, 0
	%144 = icmp eq i64 %143, 0
	br i1 %144, label %.L756, label %.L757
.L757:
	%145 = getelementptr i64, ptr @.STR275, i64 0
	%146 = ptrtoint ptr %145 to i64
	%147 = call i64 @println(i64 %146)
	store i64 %147, ptr %1, align 8
	br label %.L755
.L756:
	%148 = load i64, ptr %exprKind, align 8
	; load constant 16 into %149
	%149 = add i64 16, 0
	%150 = icmp eq i64 %148, %149
	%151 = zext i1 %150 to i64
	%152 = sub i64 %151, 0
	%153 = icmp eq i64 %152, 0
	br i1 %153, label %.L759, label %.L760
.L760:
	%154 = getelementptr i64, ptr @.STR276, i64 0
	%155 = ptrtoint ptr %154 to i64
	%156 = call i64 @println(i64 %155)
	store i64 %156, ptr %1, align 8
	br label %.L758
.L759:
	%157 = getelementptr i64, ptr @.STR277, i64 0
	%158 = ptrtoint ptr %157 to i64
	%159 = call i64 @println(i64 %158)
	store i64 %159, ptr %1, align 8
	br label %.L758
.L758:
	br label %.L755
.L755:
	br label %.L752
.L752:
	br label %.L749
.L749:
	br label %.L746
.L746:
	br label %.L743
.L743:
	br label %.L740
.L740:
	br label %.L737
.L737:
	br label %.L734
.L734:
	br label %.L731
.L731:
	br label %.L728
.L728:
	br label %.L725
.L725:
	br label %.L722
.L722:
	br label %.L719
.L719:
	%160 = load i64, ptr %genInstr, align 8
	store i64 %160, ptr %1, align 8
	br label %.L761
.L761:
	%161= load i64, ptr %1, align 8
	ret i64 %161
}

@.STR277 = global [39 x i8] c"genInstrFromExprKind: case not handled\00", align 8
@.STR276 = global [49 x i8] c"genInstrFromExprKind: || should not be done here\00", align 8
@.STR275 = global [49 x i8] c"genInstrFromExprKind: && should not be done here\00", align 8
@.STR274 = global [53 x i8] c"genInstrFromExprKind: assign should not be done here\00", align 8
; function loadExprAddress
define i64 @loadExprAddress(i64 %0) {
.L762:
	%expr = alloca i64, align 8
	store i64 %0, ptr %expr, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%dest = alloca i64, align 8
	; load constant 0 into %2
	%2 = add i64 0, 0
	; load constant 1 into %3
	%3 = add i64 1, 0
	%4 = sub i64 %2, %3
	%5 = getelementptr i64, ptr %dest, i64 0
	%6 = ptrtoint ptr %5 to i64
	%7 = inttoptr i64 %6 to ptr
	store i64 %4, ptr %7, align 8
	%8  = add i64 %4, 0; bloody hack
	store i64 %4, ptr %1, align 8
	%9 = load i64, ptr %expr, align 8
	%10 = inttoptr i64 %9 to ptr
	%11 = load i64, ptr %10, align 8
	; load constant 18 into %12
	%12 = add i64 18, 0
	%13 = icmp eq i64 %11, %12
	%14 = zext i1 %13 to i64
	%15 = sub i64 %14, 0
	%16 = icmp eq i64 %15, 0
	br i1 %16, label %.L764, label %.L765
.L765:
	%17 = load i64, ptr %expr, align 8
	; load constant 8 into %18
	%18 = add i64 8, 0
	%19 = add i64 %17, %18
	%20 = inttoptr i64 %19 to ptr
	%21 = load i64, ptr %20, align 8
	%22 = call i64 @genLoadAddr(i64 %21)
	%23 = getelementptr i64, ptr %dest, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = inttoptr i64 %24 to ptr
	store i64 %22, ptr %25, align 8
	%26  = add i64 %22, 0; bloody hack
	store i64 %22, ptr %1, align 8
	br label %.L763
.L764:
	%.TMP26 = alloca i64, align 8
	%27 = load i64, ptr %expr, align 8
	%28 = inttoptr i64 %27 to ptr
	%29 = load i64, ptr %28, align 8
	; load constant 1 into %30
	%30 = add i64 1, 0
	%31 = icmp eq i64 %29, %30
	%32 = zext i1 %31 to i64
	%33 = sub i64 %32, 0
	%34 = icmp eq i64 %33, 0
	br i1 %34, label %.L769, label %.L771
.L771:
	%35 = getelementptr i64, ptr %.TMP26, i64 0
	%36 = ptrtoint ptr %35 to i64
	; load constant 1 into %37
	%37 = add i64 1, 0
	%38 = inttoptr i64 %36 to ptr
	store i64 %37, ptr %38, align 8
	%39  = add i64 %37, 0; bloody hack
	br label %.L768
.L769:
	%40 = load i64, ptr %expr, align 8
	%41 = inttoptr i64 %40 to ptr
	%42 = load i64, ptr %41, align 8
	; load constant 2 into %43
	%43 = add i64 2, 0
	%44 = icmp eq i64 %42, %43
	%45 = zext i1 %44 to i64
	%46 = sub i64 %45, 0
	%47 = icmp ne i64 %46, 0
	br i1 %47, label %.L770, label %.L772
.L772:
	%48 = getelementptr i64, ptr %.TMP26, i64 0
	%49 = ptrtoint ptr %48 to i64
	; load constant 0 into %50
	%50 = add i64 0, 0
	%51 = inttoptr i64 %49 to ptr
	store i64 %50, ptr %51, align 8
	%52  = add i64 %50, 0; bloody hack
	br label %.L768
.L770:
	%53 = getelementptr i64, ptr %.TMP26, i64 0
	%54 = ptrtoint ptr %53 to i64
	; load constant 1 into %55
	%55 = add i64 1, 0
	%56 = inttoptr i64 %54 to ptr
	store i64 %55, ptr %56, align 8
	%57  = add i64 %55, 0; bloody hack
	br label %.L768
.L768:
	%58 = getelementptr i64, ptr %.TMP26, i64 0
	%59 = ptrtoint ptr %58 to i64
	%60 = inttoptr i64 %59 to ptr
	%61 = load i64, ptr %60, align 8
	%62 = sub i64 %61, 0
	%63 = icmp eq i64 %62, 0
	br i1 %63, label %.L767, label %.L773
.L773:
	%64 = load i64, ptr %expr, align 8
	; load constant 8 into %65
	%65 = add i64 8, 0
	%66 = add i64 %64, %65
	%67 = inttoptr i64 %66 to ptr
	%68 = load i64, ptr %67, align 8
	%69 = call i64 @loadExpr(i64 %68)
	%70 = getelementptr i64, ptr %dest, i64 0
	%71 = ptrtoint ptr %70 to i64
	%72 = inttoptr i64 %71 to ptr
	store i64 %69, ptr %72, align 8
	%73  = add i64 %69, 0; bloody hack
	store i64 %69, ptr %1, align 8
	br label %.L766
.L767:
	%74 = getelementptr i64, ptr @.STR278, i64 0
	%75 = ptrtoint ptr %74 to i64
	%76 = call i64 @println(i64 %75)
	store i64 %76, ptr %1, align 8
	%77 = getelementptr i64, ptr @.STR279, i64 0
	%78 = ptrtoint ptr %77 to i64
	%79 = call i64 @print(i64 %78)
	store i64 %79, ptr %1, align 8
	%80 = load i64, ptr %expr, align 8
	%81 = inttoptr i64 %80 to ptr
	%82 = load i64, ptr %81, align 8
	%83 = call i64 @printInt(i64 %82)
	store i64 %83, ptr %1, align 8
	; load constant 0 into %84
	%84 = add i64 0, 0
	%85 = call i64 @println(i64 %84)
	store i64 %85, ptr %1, align 8
	%86 = load i64, ptr %expr, align 8
	%87 = call i64 @printExprTree(i64 %86)
	store i64 %87, ptr %1, align 8
	br label %.L766
.L766:
	br label %.L763
.L763:
	%88 = load i64, ptr %dest, align 8
	store i64 %88, ptr %1, align 8
	br label %.L774
.L774:
	%89= load i64, ptr %1, align 8
	ret i64 %89
}

@.STR279 = global [15 x i8] c"expr kind is: \00", align 8
@.STR278 = global [6 x i8] c"What?\00", align 8
; function loadExpr
define i64 @loadExpr(i64 %0) {
.L775:
	%expr = alloca i64, align 8
	store i64 %0, ptr %expr, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%dest = alloca i64, align 8
	; load constant 0 into %2
	%2 = add i64 0, 0
	; load constant 1 into %3
	%3 = add i64 1, 0
	%4 = sub i64 %2, %3
	%5 = getelementptr i64, ptr %dest, i64 0
	%6 = ptrtoint ptr %5 to i64
	%7 = inttoptr i64 %6 to ptr
	store i64 %4, ptr %7, align 8
	%8  = add i64 %4, 0; bloody hack
	store i64 %4, ptr %1, align 8
	%n = alloca i64, align 8
	%endLabel = alloca i64, align 8
	%rhsLabel = alloca i64, align 8
	%trueLabel = alloca i64, align 8
	%tmp = alloca i64, align 8
	%val = alloca i64, align 8
	%addr = alloca i64, align 8
	%left = alloca i64, align 8
	%right = alloca i64, align 8
	%9 = load i64, ptr %expr, align 8
	%10 = inttoptr i64 %9 to ptr
	%11 = load i64, ptr %10, align 8
	; load constant 17 into %12
	%12 = add i64 17, 0
	%13 = icmp eq i64 %11, %12
	%14 = zext i1 %13 to i64
	%15 = sub i64 %14, 0
	%16 = icmp eq i64 %15, 0
	br i1 %16, label %.L777, label %.L778
.L778:
	%17 = load i64, ptr %expr, align 8
	; load constant 8 into %18
	%18 = add i64 8, 0
	%19 = add i64 %17, %18
	%20 = inttoptr i64 %19 to ptr
	%21 = load i64, ptr %20, align 8
	%22 = call i64 @genConstant(i64 %21)
	%23 = getelementptr i64, ptr %dest, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = inttoptr i64 %24 to ptr
	store i64 %22, ptr %25, align 8
	%26  = add i64 %22, 0; bloody hack
	store i64 %22, ptr %1, align 8
	br label %.L776
.L777:
	%27 = load i64, ptr %expr, align 8
	%28 = inttoptr i64 %27 to ptr
	%29 = load i64, ptr %28, align 8
	; load constant 18 into %30
	%30 = add i64 18, 0
	%31 = icmp eq i64 %29, %30
	%32 = zext i1 %31 to i64
	%33 = sub i64 %32, 0
	%34 = icmp eq i64 %33, 0
	br i1 %34, label %.L780, label %.L781
.L781:
	%35 = load i64, ptr %expr, align 8
	; load constant 8 into %36
	%36 = add i64 8, 0
	%37 = add i64 %35, %36
	%38 = inttoptr i64 %37 to ptr
	%39 = load i64, ptr %38, align 8
	%40 = call i64 @genLoadVar(i64 %39)
	%41 = getelementptr i64, ptr %dest, i64 0
	%42 = ptrtoint ptr %41 to i64
	%43 = inttoptr i64 %42 to ptr
	store i64 %40, ptr %43, align 8
	%44  = add i64 %40, 0; bloody hack
	store i64 %40, ptr %1, align 8
	br label %.L779
.L780:
	%45 = load i64, ptr %expr, align 8
	%46 = inttoptr i64 %45 to ptr
	%47 = load i64, ptr %46, align 8
	; load constant 0 into %48
	%48 = add i64 0, 0
	%49 = icmp eq i64 %47, %48
	%50 = zext i1 %49 to i64
	%51 = sub i64 %50, 0
	%52 = icmp eq i64 %51, 0
	br i1 %52, label %.L783, label %.L784
.L784:
	%53 = load i64, ptr %expr, align 8
	; load constant 8 into %54
	%54 = add i64 8, 0
	%55 = add i64 %53, %54
	%56 = inttoptr i64 %55 to ptr
	%57 = load i64, ptr %56, align 8
	%58 = call i64 @loadExprAddress(i64 %57)
	%59 = getelementptr i64, ptr %dest, i64 0
	%60 = ptrtoint ptr %59 to i64
	%61 = inttoptr i64 %60 to ptr
	store i64 %58, ptr %61, align 8
	%62  = add i64 %58, 0; bloody hack
	store i64 %58, ptr %1, align 8
	br label %.L782
.L783:
	%63 = load i64, ptr %expr, align 8
	%64 = inttoptr i64 %63 to ptr
	%65 = load i64, ptr %64, align 8
	; load constant 1 into %66
	%66 = add i64 1, 0
	%67 = icmp eq i64 %65, %66
	%68 = zext i1 %67 to i64
	%69 = sub i64 %68, 0
	%70 = icmp eq i64 %69, 0
	br i1 %70, label %.L786, label %.L787
.L787:
	%71 = load i64, ptr %expr, align 8
	; load constant 8 into %72
	%72 = add i64 8, 0
	%73 = add i64 %71, %72
	%74 = inttoptr i64 %73 to ptr
	%75 = load i64, ptr %74, align 8
	%76 = call i64 @loadExpr(i64 %75)
	%77 = call i64 @genFetch(i64 %76)
	%78 = getelementptr i64, ptr %dest, i64 0
	%79 = ptrtoint ptr %78 to i64
	%80 = inttoptr i64 %79 to ptr
	store i64 %77, ptr %80, align 8
	%81  = add i64 %77, 0; bloody hack
	store i64 %77, ptr %1, align 8
	br label %.L785
.L786:
	%82 = load i64, ptr %expr, align 8
	%83 = inttoptr i64 %82 to ptr
	%84 = load i64, ptr %83, align 8
	; load constant 2 into %85
	%85 = add i64 2, 0
	%86 = icmp eq i64 %84, %85
	%87 = zext i1 %86 to i64
	%88 = sub i64 %87, 0
	%89 = icmp eq i64 %88, 0
	br i1 %89, label %.L789, label %.L790
.L790:
	%90 = load i64, ptr %expr, align 8
	; load constant 8 into %91
	%91 = add i64 8, 0
	%92 = add i64 %90, %91
	%93 = inttoptr i64 %92 to ptr
	%94 = load i64, ptr %93, align 8
	%95 = call i64 @loadExpr(i64 %94)
	%96 = call i64 @genFetchByte(i64 %95)
	%97 = getelementptr i64, ptr %dest, i64 0
	%98 = ptrtoint ptr %97 to i64
	%99 = inttoptr i64 %98 to ptr
	store i64 %96, ptr %99, align 8
	%100  = add i64 %96, 0; bloody hack
	store i64 %96, ptr %1, align 8
	br label %.L788
.L789:
	%101 = load i64, ptr %expr, align 8
	%102 = inttoptr i64 %101 to ptr
	%103 = load i64, ptr %102, align 8
	; load constant 19 into %104
	%104 = add i64 19, 0
	%105 = icmp eq i64 %103, %104
	%106 = zext i1 %105 to i64
	%107 = sub i64 %106, 0
	%108 = icmp eq i64 %107, 0
	br i1 %108, label %.L792, label %.L793
.L793:
	%109 = load i64, ptr %expr, align 8
	; load constant 16 into %110
	%110 = add i64 16, 0
	%111 = add i64 %109, %110
	%112 = inttoptr i64 %111 to ptr
	%113 = load i64, ptr %112, align 8
	%114 = load i64, ptr %expr, align 8
	; load constant 8 into %115
	%115 = add i64 8, 0
	%116 = add i64 %114, %115
	%117 = inttoptr i64 %116 to ptr
	%118 = load i64, ptr %117, align 8
	%119 = call i64 @genCallBegin(i64 %118, i64 %113)
	store i64 %119, ptr %1, align 8
	%120 = load i64, ptr %expr, align 8
	; load constant 24 into %121
	%121 = add i64 24, 0
	%122 = add i64 %120, %121
	%123 = inttoptr i64 %122 to ptr
	%124 = load i64, ptr %123, align 8
	%125 = getelementptr i64, ptr %n, i64 0
	%126 = ptrtoint ptr %125 to i64
	%127 = inttoptr i64 %126 to ptr
	store i64 %124, ptr %127, align 8
	%128  = add i64 %124, 0; bloody hack
	store i64 %124, ptr %1, align 8
	br label %.L794
.L794:
	%129 = load i64, ptr %n, align 8
	%130 = sub i64 %129, 0
	%131 = icmp eq i64 %130, 0
	br i1 %131, label %.L795, label %.L796
.L796:
	; load constant 0 into %132
	%132 = add i64 0, 0
	%133 = load i64, ptr %n, align 8
	; load constant 16 into %134
	%134 = add i64 16, 0
	%135 = add i64 %133, %134
	%136 = inttoptr i64 %135 to ptr
	%137 = load i64, ptr %136, align 8
	%138 = call i64 @loadExpr(i64 %137)
	%139 = call i64 @genCallAddArg(i64 %138, i64 %132)
	store i64 %139, ptr %1, align 8
	%140 = load i64, ptr %n, align 8
	; load constant 8 into %141
	%141 = add i64 8, 0
	%142 = add i64 %140, %141
	%143 = inttoptr i64 %142 to ptr
	%144 = load i64, ptr %143, align 8
	%145 = getelementptr i64, ptr %n, i64 0
	%146 = ptrtoint ptr %145 to i64
	%147 = inttoptr i64 %146 to ptr
	store i64 %144, ptr %147, align 8
	%148  = add i64 %144, 0; bloody hack
	store i64 %144, ptr %1, align 8
	br label %.L794
.L795:
	%149 = call i64 @genCallEnd()
	%150 = getelementptr i64, ptr %dest, i64 0
	%151 = ptrtoint ptr %150 to i64
	%152 = inttoptr i64 %151 to ptr
	store i64 %149, ptr %152, align 8
	%153  = add i64 %149, 0; bloody hack
	store i64 %149, ptr %1, align 8
	br label %.L791
.L792:
	%.TMP27 = alloca i64, align 8
	%154 = load i64, ptr %expr, align 8
	%155 = inttoptr i64 %154 to ptr
	%156 = load i64, ptr %155, align 8
	; load constant 3 into %157
	%157 = add i64 3, 0
	%158 = icmp sge i64 %156, %157
	%159 = zext i1 %158 to i64
	%160 = sub i64 %159, 0
	%161 = icmp ne i64 %160, 0
	br i1 %161, label %.L800, label %.L802
.L802:
	%162 = getelementptr i64, ptr %.TMP27, i64 0
	%163 = ptrtoint ptr %162 to i64
	; load constant 0 into %164
	%164 = add i64 0, 0
	%165 = inttoptr i64 %163 to ptr
	store i64 %164, ptr %165, align 8
	%166  = add i64 %164, 0; bloody hack
	; jump to end
	br label %.L799
.L800:
	%167 = load i64, ptr %expr, align 8
	%168 = inttoptr i64 %167 to ptr
	%169 = load i64, ptr %168, align 8
	; load constant 17 into %170
	%170 = add i64 17, 0
	%171 = icmp slt i64 %169, %170
	%172 = zext i1 %171 to i64
	%173 = sub i64 %172, 0
	%174 = icmp ne i64 %173, 0
	br i1 %174, label %.L801, label %.L803
.L803:
	%175 = getelementptr i64, ptr %.TMP27, i64 0
	%176 = ptrtoint ptr %175 to i64
	; load constant 0 into %177
	%177 = add i64 0, 0
	%178 = inttoptr i64 %176 to ptr
	store i64 %177, ptr %178, align 8
	%179  = add i64 %177, 0; bloody hack
	; jump to end
	br label %.L799
.L801:
	%180 = getelementptr i64, ptr %.TMP27, i64 0
	%181 = ptrtoint ptr %180 to i64
	; load constant 1 into %182
	%182 = add i64 1, 0
	%183 = inttoptr i64 %181 to ptr
	store i64 %182, ptr %183, align 8
	%184  = add i64 %182, 0; bloody hack
	br label %.L799
.L799:
	%185 = getelementptr i64, ptr %.TMP27, i64 0
	%186 = ptrtoint ptr %185 to i64
	%187 = inttoptr i64 %186 to ptr
	%188 = load i64, ptr %187, align 8
	%189 = sub i64 %188, 0
	%190 = icmp eq i64 %189, 0
	br i1 %190, label %.L798, label %.L804
.L804:
	%191 = load i64, ptr %expr, align 8
	%192 = inttoptr i64 %191 to ptr
	%193 = load i64, ptr %192, align 8
	; load constant 15 into %194
	%194 = add i64 15, 0
	%195 = icmp eq i64 %193, %194
	%196 = zext i1 %195 to i64
	%197 = sub i64 %196, 0
	%198 = icmp eq i64 %197, 0
	br i1 %198, label %.L806, label %.L807
.L807:
	%199 = call i64 @genGetLabel()
	%200 = getelementptr i64, ptr %endLabel, i64 0
	%201 = ptrtoint ptr %200 to i64
	%202 = inttoptr i64 %201 to ptr
	store i64 %199, ptr %202, align 8
	%203  = add i64 %199, 0; bloody hack
	store i64 %199, ptr %1, align 8
	%204 = call i64 @genGetLabel()
	%205 = getelementptr i64, ptr %rhsLabel, i64 0
	%206 = ptrtoint ptr %205 to i64
	%207 = inttoptr i64 %206 to ptr
	store i64 %204, ptr %207, align 8
	%208  = add i64 %204, 0; bloody hack
	store i64 %204, ptr %1, align 8
	%209 = call i64 @genGetLabel()
	%210 = getelementptr i64, ptr %trueLabel, i64 0
	%211 = ptrtoint ptr %210 to i64
	%212 = inttoptr i64 %211 to ptr
	store i64 %209, ptr %212, align 8
	%213  = add i64 %209, 0; bloody hack
	store i64 %209, ptr %1, align 8
	%214 = call i64 @genGetTmp()
	%215 = getelementptr i64, ptr %tmp, i64 0
	%216 = ptrtoint ptr %215 to i64
	%217 = inttoptr i64 %216 to ptr
	store i64 %214, ptr %217, align 8
	%218  = add i64 %214, 0; bloody hack
	store i64 %214, ptr %1, align 8
	%219 = load i64, ptr %expr, align 8
	; load constant 8 into %220
	%220 = add i64 8, 0
	%221 = add i64 %219, %220
	%222 = inttoptr i64 %221 to ptr
	%223 = load i64, ptr %222, align 8
	%224 = call i64 @loadExpr(i64 %223)
	%225 = getelementptr i64, ptr %left, i64 0
	%226 = ptrtoint ptr %225 to i64
	%227 = inttoptr i64 %226 to ptr
	store i64 %224, ptr %227, align 8
	%228  = add i64 %224, 0; bloody hack
	store i64 %224, ptr %1, align 8
	%229 = load i64, ptr %rhsLabel, align 8
	%230 = load i64, ptr %left, align 8
	%231 = call i64 @genJumpIfTrue(i64 %230, i64 %229)
	store i64 %231, ptr %1, align 8
	%232 = load i64, ptr %tmp, align 8
	; load constant 0 into %233
	%233 = add i64 0, 0
	%234 = call i64 @genSaveBoolInTmp(i64 %233, i64 %232)
	store i64 %234, ptr %1, align 8
	%235 = getelementptr i64, ptr @.STR280, i64 0
	%236 = ptrtoint ptr %235 to i64
	%237 = call i64 @println(i64 %236)
	store i64 %237, ptr %1, align 8
	%238 = load i64, ptr %endLabel, align 8
	%239 = call i64 @genJump(i64 %238)
	store i64 %239, ptr %1, align 8
	%240 = load i64, ptr %rhsLabel, align 8
	%241 = call i64 @genDefLabel(i64 %240)
	store i64 %241, ptr %1, align 8
	%242 = load i64, ptr %expr, align 8
	; load constant 16 into %243
	%243 = add i64 16, 0
	%244 = add i64 %242, %243
	%245 = inttoptr i64 %244 to ptr
	%246 = load i64, ptr %245, align 8
	%247 = call i64 @loadExpr(i64 %246)
	%248 = getelementptr i64, ptr %right, i64 0
	%249 = ptrtoint ptr %248 to i64
	%250 = inttoptr i64 %249 to ptr
	store i64 %247, ptr %250, align 8
	%251  = add i64 %247, 0; bloody hack
	store i64 %247, ptr %1, align 8
	%252 = load i64, ptr %trueLabel, align 8
	%253 = load i64, ptr %right, align 8
	%254 = call i64 @genJumpIfTrue(i64 %253, i64 %252)
	store i64 %254, ptr %1, align 8
	%255 = load i64, ptr %tmp, align 8
	; load constant 0 into %256
	%256 = add i64 0, 0
	%257 = call i64 @genSaveBoolInTmp(i64 %256, i64 %255)
	store i64 %257, ptr %1, align 8
	%258 = getelementptr i64, ptr @.STR281, i64 0
	%259 = ptrtoint ptr %258 to i64
	%260 = call i64 @println(i64 %259)
	store i64 %260, ptr %1, align 8
	%261 = load i64, ptr %endLabel, align 8
	%262 = call i64 @genJump(i64 %261)
	store i64 %262, ptr %1, align 8
	%263 = load i64, ptr %trueLabel, align 8
	%264 = call i64 @genDefLabel(i64 %263)
	store i64 %264, ptr %1, align 8
	%265 = load i64, ptr %tmp, align 8
	; load constant 1 into %266
	%266 = add i64 1, 0
	%267 = call i64 @genSaveBoolInTmp(i64 %266, i64 %265)
	store i64 %267, ptr %1, align 8
	%268 = load i64, ptr %endLabel, align 8
	%269 = call i64 @genDefLabel(i64 %268)
	store i64 %269, ptr %1, align 8
	%270 = load i64, ptr %tmp, align 8
	%271 = call i64 @genLoadFromTmp(i64 %270)
	%272 = getelementptr i64, ptr %dest, i64 0
	%273 = ptrtoint ptr %272 to i64
	%274 = inttoptr i64 %273 to ptr
	store i64 %271, ptr %274, align 8
	%275  = add i64 %271, 0; bloody hack
	store i64 %271, ptr %1, align 8
	br label %.L805
.L806:
	%276 = load i64, ptr %expr, align 8
	%277 = inttoptr i64 %276 to ptr
	%278 = load i64, ptr %277, align 8
	; load constant 16 into %279
	%279 = add i64 16, 0
	%280 = icmp eq i64 %278, %279
	%281 = zext i1 %280 to i64
	%282 = sub i64 %281, 0
	%283 = icmp eq i64 %282, 0
	br i1 %283, label %.L809, label %.L810
.L810:
	%284 = call i64 @genGetLabel()
	%285 = getelementptr i64, ptr %endLabel, i64 0
	%286 = ptrtoint ptr %285 to i64
	%287 = inttoptr i64 %286 to ptr
	store i64 %284, ptr %287, align 8
	%288  = add i64 %284, 0; bloody hack
	store i64 %284, ptr %1, align 8
	%289 = call i64 @genGetLabel()
	%290 = getelementptr i64, ptr %rhsLabel, i64 0
	%291 = ptrtoint ptr %290 to i64
	%292 = inttoptr i64 %291 to ptr
	store i64 %289, ptr %292, align 8
	%293  = add i64 %289, 0; bloody hack
	store i64 %289, ptr %1, align 8
	%294 = call i64 @genGetLabel()
	%295 = getelementptr i64, ptr %trueLabel, i64 0
	%296 = ptrtoint ptr %295 to i64
	%297 = inttoptr i64 %296 to ptr
	store i64 %294, ptr %297, align 8
	%298  = add i64 %294, 0; bloody hack
	store i64 %294, ptr %1, align 8
	%299 = call i64 @genGetTmp()
	%300 = getelementptr i64, ptr %tmp, i64 0
	%301 = ptrtoint ptr %300 to i64
	%302 = inttoptr i64 %301 to ptr
	store i64 %299, ptr %302, align 8
	%303  = add i64 %299, 0; bloody hack
	store i64 %299, ptr %1, align 8
	%304 = load i64, ptr %expr, align 8
	; load constant 8 into %305
	%305 = add i64 8, 0
	%306 = add i64 %304, %305
	%307 = inttoptr i64 %306 to ptr
	%308 = load i64, ptr %307, align 8
	%309 = call i64 @loadExpr(i64 %308)
	%310 = getelementptr i64, ptr %left, i64 0
	%311 = ptrtoint ptr %310 to i64
	%312 = inttoptr i64 %311 to ptr
	store i64 %309, ptr %312, align 8
	%313  = add i64 %309, 0; bloody hack
	store i64 %309, ptr %1, align 8
	%314 = load i64, ptr %rhsLabel, align 8
	%315 = load i64, ptr %left, align 8
	%316 = call i64 @genJumpIfFalse(i64 %315, i64 %314)
	store i64 %316, ptr %1, align 8
	%317 = load i64, ptr %tmp, align 8
	; load constant 1 into %318
	%318 = add i64 1, 0
	%319 = call i64 @genSaveBoolInTmp(i64 %318, i64 %317)
	store i64 %319, ptr %1, align 8
	%320 = load i64, ptr %endLabel, align 8
	%321 = call i64 @genJump(i64 %320)
	store i64 %321, ptr %1, align 8
	%322 = load i64, ptr %rhsLabel, align 8
	%323 = call i64 @genDefLabel(i64 %322)
	store i64 %323, ptr %1, align 8
	%324 = load i64, ptr %expr, align 8
	; load constant 16 into %325
	%325 = add i64 16, 0
	%326 = add i64 %324, %325
	%327 = inttoptr i64 %326 to ptr
	%328 = load i64, ptr %327, align 8
	%329 = call i64 @loadExpr(i64 %328)
	%330 = getelementptr i64, ptr %right, i64 0
	%331 = ptrtoint ptr %330 to i64
	%332 = inttoptr i64 %331 to ptr
	store i64 %329, ptr %332, align 8
	%333  = add i64 %329, 0; bloody hack
	store i64 %329, ptr %1, align 8
	%334 = load i64, ptr %trueLabel, align 8
	%335 = load i64, ptr %right, align 8
	%336 = call i64 @genJumpIfTrue(i64 %335, i64 %334)
	store i64 %336, ptr %1, align 8
	%337 = load i64, ptr %tmp, align 8
	; load constant 0 into %338
	%338 = add i64 0, 0
	%339 = call i64 @genSaveBoolInTmp(i64 %338, i64 %337)
	store i64 %339, ptr %1, align 8
	%340 = load i64, ptr %endLabel, align 8
	%341 = call i64 @genJump(i64 %340)
	store i64 %341, ptr %1, align 8
	%342 = load i64, ptr %trueLabel, align 8
	%343 = call i64 @genDefLabel(i64 %342)
	store i64 %343, ptr %1, align 8
	%344 = load i64, ptr %tmp, align 8
	; load constant 1 into %345
	%345 = add i64 1, 0
	%346 = call i64 @genSaveBoolInTmp(i64 %345, i64 %344)
	store i64 %346, ptr %1, align 8
	%347 = load i64, ptr %endLabel, align 8
	%348 = call i64 @genDefLabel(i64 %347)
	store i64 %348, ptr %1, align 8
	%349 = load i64, ptr %tmp, align 8
	%350 = call i64 @genLoadFromTmp(i64 %349)
	%351 = getelementptr i64, ptr %dest, i64 0
	%352 = ptrtoint ptr %351 to i64
	%353 = inttoptr i64 %352 to ptr
	store i64 %350, ptr %353, align 8
	%354  = add i64 %350, 0; bloody hack
	store i64 %350, ptr %1, align 8
	br label %.L808
.L809:
	%355 = load i64, ptr %expr, align 8
	%356 = inttoptr i64 %355 to ptr
	%357 = load i64, ptr %356, align 8
	; load constant 7 into %358
	%358 = add i64 7, 0
	%359 = icmp eq i64 %357, %358
	%360 = zext i1 %359 to i64
	%361 = sub i64 %360, 0
	%362 = icmp eq i64 %361, 0
	br i1 %362, label %.L812, label %.L813
.L813:
	%363 = load i64, ptr %expr, align 8
	; load constant 16 into %364
	%364 = add i64 16, 0
	%365 = add i64 %363, %364
	%366 = inttoptr i64 %365 to ptr
	%367 = load i64, ptr %366, align 8
	%368 = call i64 @loadExpr(i64 %367)
	%369 = getelementptr i64, ptr %val, i64 0
	%370 = ptrtoint ptr %369 to i64
	%371 = inttoptr i64 %370 to ptr
	store i64 %368, ptr %371, align 8
	%372  = add i64 %368, 0; bloody hack
	store i64 %368, ptr %1, align 8
	%373 = load i64, ptr %expr, align 8
	; load constant 8 into %374
	%374 = add i64 8, 0
	%375 = add i64 %373, %374
	%376 = inttoptr i64 %375 to ptr
	%377 = load i64, ptr %376, align 8
	%378 = call i64 @loadExprAddress(i64 %377)
	%379 = getelementptr i64, ptr %addr, i64 0
	%380 = ptrtoint ptr %379 to i64
	%381 = inttoptr i64 %380 to ptr
	store i64 %378, ptr %381, align 8
	%382  = add i64 %378, 0; bloody hack
	store i64 %378, ptr %1, align 8
	%383 = load i64, ptr %expr, align 8
	; load constant 8 into %384
	%384 = add i64 8, 0
	%385 = add i64 %383, %384
	%386 = inttoptr i64 %385 to ptr
	%387 = load i64, ptr %386, align 8
	%388 = inttoptr i64 %387 to ptr
	%389 = load i64, ptr %388, align 8
	; load constant 2 into %390
	%390 = add i64 2, 0
	%391 = icmp eq i64 %389, %390
	%392 = zext i1 %391 to i64
	%393 = sub i64 %392, 0
	%394 = icmp eq i64 %393, 0
	br i1 %394, label %.L815, label %.L816
.L816:
	%395 = load i64, ptr %addr, align 8
	%396 = load i64, ptr %val, align 8
	%397 = call i64 @genStoreByte(i64 %396, i64 %395)
	store i64 %397, ptr %1, align 8
	br label %.L814
.L815:
	%398 = load i64, ptr %addr, align 8
	%399 = load i64, ptr %val, align 8
	%400 = call i64 @genStore(i64 %399, i64 %398)
	store i64 %400, ptr %1, align 8
	br label %.L814
.L814:
	%401 = load i64, ptr %val, align 8
	%402 = getelementptr i64, ptr %dest, i64 0
	%403 = ptrtoint ptr %402 to i64
	%404 = inttoptr i64 %403 to ptr
	store i64 %401, ptr %404, align 8
	%405  = add i64 %401, 0; bloody hack
	store i64 %401, ptr %1, align 8
	br label %.L811
.L812:
	%406 = load i64, ptr %expr, align 8
	; load constant 8 into %407
	%407 = add i64 8, 0
	%408 = add i64 %406, %407
	%409 = inttoptr i64 %408 to ptr
	%410 = load i64, ptr %409, align 8
	%411 = call i64 @loadExpr(i64 %410)
	%412 = getelementptr i64, ptr %left, i64 0
	%413 = ptrtoint ptr %412 to i64
	%414 = inttoptr i64 %413 to ptr
	store i64 %411, ptr %414, align 8
	%415  = add i64 %411, 0; bloody hack
	store i64 %411, ptr %1, align 8
	%416 = load i64, ptr %expr, align 8
	; load constant 16 into %417
	%417 = add i64 16, 0
	%418 = add i64 %416, %417
	%419 = inttoptr i64 %418 to ptr
	%420 = load i64, ptr %419, align 8
	%421 = call i64 @loadExpr(i64 %420)
	%422 = getelementptr i64, ptr %right, i64 0
	%423 = ptrtoint ptr %422 to i64
	%424 = inttoptr i64 %423 to ptr
	store i64 %421, ptr %424, align 8
	%425  = add i64 %421, 0; bloody hack
	store i64 %421, ptr %1, align 8
	%426 = load i64, ptr %left, align 8
	%427 = load i64, ptr %right, align 8
	%428 = load i64, ptr %expr, align 8
	%429 = inttoptr i64 %428 to ptr
	%430 = load i64, ptr %429, align 8
	%431 = call i64 @genInstrFromExprKind(i64 %430)
	%432 = call i64 @genInstr(i64 %431, i64 %427, i64 %426)
	%433 = getelementptr i64, ptr %dest, i64 0
	%434 = ptrtoint ptr %433 to i64
	%435 = inttoptr i64 %434 to ptr
	store i64 %432, ptr %435, align 8
	%436  = add i64 %432, 0; bloody hack
	store i64 %432, ptr %1, align 8
	br label %.L811
.L811:
	br label %.L808
.L808:
	br label %.L805
.L805:
	br label %.L797
.L798:
	%437 = getelementptr i64, ptr @.STR282, i64 0
	%438 = ptrtoint ptr %437 to i64
	%439 = call i64 @println(i64 %438)
	store i64 %439, ptr %1, align 8
	br label %.L797
.L797:
	br label %.L791
.L791:
	br label %.L788
.L788:
	br label %.L785
.L785:
	br label %.L782
.L782:
	br label %.L779
.L779:
	br label %.L776
.L776:
	%440 = load i64, ptr %dest, align 8
	store i64 %440, ptr %1, align 8
	br label %.L817
.L817:
	%441= load i64, ptr %1, align 8
	ret i64 %441
}

@.STR282 = global [32 x i8] c"loadExpr: not all cases handled\00", align 8
@.STR281 = global [15 x i8] c"	; jump to end\00", align 8
@.STR280 = global [15 x i8] c"	; jump to end\00", align 8
; function testExpr
define i64 @testExpr() {
.L818:
	%0 = alloca i64, align 8 ; ptr to ret val
	%expr = alloca i64, align 8
	%c2 = alloca i64, align 8
	%c3 = alloca i64, align 8
	%c4 = alloca i64, align 8
	%cX = alloca i64, align 8
	%1 = getelementptr i64, ptr @.STR283, i64 0
	%2 = ptrtoint ptr %1 to i64
	%3 = call i64 @UStrCreate(i64 %2)
	%4 = getelementptr i64, ptr %c2, i64 0
	%5 = ptrtoint ptr %4 to i64
	%6 = inttoptr i64 %5 to ptr
	store i64 %3, ptr %6, align 8
	%7  = add i64 %3, 0; bloody hack
	store i64 %3, ptr %0, align 8
	%8 = getelementptr i64, ptr @.STR284, i64 0
	%9 = ptrtoint ptr %8 to i64
	%10 = call i64 @UStrCreate(i64 %9)
	%11 = getelementptr i64, ptr %c3, i64 0
	%12 = ptrtoint ptr %11 to i64
	%13 = inttoptr i64 %12 to ptr
	store i64 %10, ptr %13, align 8
	%14  = add i64 %10, 0; bloody hack
	store i64 %10, ptr %0, align 8
	%15 = getelementptr i64, ptr @.STR285, i64 0
	%16 = ptrtoint ptr %15 to i64
	%17 = call i64 @UStrCreate(i64 %16)
	%18 = getelementptr i64, ptr %c4, i64 0
	%19 = ptrtoint ptr %18 to i64
	%20 = inttoptr i64 %19 to ptr
	store i64 %17, ptr %20, align 8
	%21  = add i64 %17, 0; bloody hack
	store i64 %17, ptr %0, align 8
	%22 = getelementptr i64, ptr @.STR286, i64 0
	%23 = ptrtoint ptr %22 to i64
	%24 = call i64 @UStrCreate(i64 %23)
	%25 = getelementptr i64, ptr %cX, i64 0
	%26 = ptrtoint ptr %25 to i64
	%27 = inttoptr i64 %26 to ptr
	store i64 %24, ptr %27, align 8
	%28  = add i64 %24, 0; bloody hack
	store i64 %24, ptr %0, align 8
	%29 = call i64 @genInitCode()
	store i64 %29, ptr %0, align 8
	%30 = getelementptr i64, ptr @.STR287, i64 0
	%31 = ptrtoint ptr %30 to i64
	%32 = call i64 @UStrCreate(i64 %31)
	%33 = call i64 @genFuncDefBegin(i64 %32)
	store i64 %33, ptr %0, align 8
	%34 = load i64, ptr %cX, align 8
	%35 = call i64 @genAddLocal(i64 %34)
	store i64 %35, ptr %0, align 8
	%36 = getelementptr i64, ptr @.STR288, i64 0
	%37 = ptrtoint ptr %36 to i64
	%38 = call i64 @UStrCreate(i64 %37)
	%39 = call i64 @createIntegerExpr(i64 %38)
	%40 = getelementptr i64, ptr %expr, i64 0
	%41 = ptrtoint ptr %40 to i64
	%42 = inttoptr i64 %41 to ptr
	store i64 %39, ptr %42, align 8
	%43  = add i64 %39, 0; bloody hack
	store i64 %39, ptr %0, align 8
	%44 = getelementptr i64, ptr @.STR289, i64 0
	%45 = ptrtoint ptr %44 to i64
	%46 = call i64 @print(i64 %45)
	store i64 %46, ptr %0, align 8
	%47 = load i64, ptr %expr, align 8
	%48 = call i64 @printExprTree(i64 %47)
	store i64 %48, ptr %0, align 8
	; load constant 0 into %49
	%49 = add i64 0, 0
	%50 = call i64 @println(i64 %49)
	store i64 %50, ptr %0, align 8
	%51 = load i64, ptr %c4, align 8
	%52 = call i64 @createIntegerExpr(i64 %51)
	%53 = load i64, ptr %c3, align 8
	%54 = call i64 @createIntegerExpr(i64 %53)
	%55 = load i64, ptr %c2, align 8
	%56 = call i64 @createIntegerExpr(i64 %55)
	; load constant 5 into %57
	%57 = add i64 5, 0
	%58 = call i64 @createBinaryExpr(i64 %57, i64 %56, i64 %54)
	; load constant 4 into %59
	%59 = add i64 4, 0
	%60 = call i64 @createBinaryExpr(i64 %59, i64 %58, i64 %52)
	%61 = getelementptr i64, ptr %expr, i64 0
	%62 = ptrtoint ptr %61 to i64
	%63 = inttoptr i64 %62 to ptr
	store i64 %60, ptr %63, align 8
	%64  = add i64 %60, 0; bloody hack
	store i64 %60, ptr %0, align 8
	%65 = getelementptr i64, ptr @.STR290, i64 0
	%66 = ptrtoint ptr %65 to i64
	%67 = call i64 @print(i64 %66)
	store i64 %67, ptr %0, align 8
	%68 = load i64, ptr %expr, align 8
	%69 = call i64 @printExprTree(i64 %68)
	store i64 %69, ptr %0, align 8
	; load constant 0 into %70
	%70 = add i64 0, 0
	%71 = call i64 @println(i64 %70)
	store i64 %71, ptr %0, align 8
	%72 = load i64, ptr %expr, align 8
	%73 = load i64, ptr %cX, align 8
	%74 = call i64 @createIdentifierExpr(i64 %73)
	; load constant 6 into %75
	%75 = add i64 6, 0
	%76 = call i64 @createBinaryExpr(i64 %75, i64 %74, i64 %72)
	%77 = getelementptr i64, ptr %expr, i64 0
	%78 = ptrtoint ptr %77 to i64
	%79 = inttoptr i64 %78 to ptr
	store i64 %76, ptr %79, align 8
	%80  = add i64 %76, 0; bloody hack
	store i64 %76, ptr %0, align 8
	%81 = getelementptr i64, ptr @.STR291, i64 0
	%82 = ptrtoint ptr %81 to i64
	%83 = call i64 @print(i64 %82)
	store i64 %83, ptr %0, align 8
	%84 = load i64, ptr %expr, align 8
	%85 = call i64 @printExprTree(i64 %84)
	store i64 %85, ptr %0, align 8
	; load constant 0 into %86
	%86 = add i64 0, 0
	%87 = call i64 @println(i64 %86)
	store i64 %87, ptr %0, align 8
	%88 = load i64, ptr %expr, align 8
	%89 = call i64 @loadExpr(i64 %88)
	store i64 %89, ptr %0, align 8
	%90 = load i64, ptr %expr, align 8
	%91 = call i64 @releaseExpr(i64 %90)
	store i64 %91, ptr %0, align 8
	%92 = getelementptr i64, ptr @.STR292, i64 0
	%93 = ptrtoint ptr %92 to i64
	%94 = call i64 @UStrCreate(i64 %93)
	%95 = call i64 @createCallExpr(i64 %94)
	%96 = getelementptr i64, ptr %expr, i64 0
	%97 = ptrtoint ptr %96 to i64
	%98 = inttoptr i64 %97 to ptr
	store i64 %95, ptr %98, align 8
	%99  = add i64 %95, 0; bloody hack
	store i64 %95, ptr %0, align 8
	%100 = getelementptr i64, ptr @.STR293, i64 0
	%101 = ptrtoint ptr %100 to i64
	%102 = call i64 @UStrCreate(i64 %101)
	%103 = call i64 @createIntegerExpr(i64 %102)
	%104 = load i64, ptr %expr, align 8
	%105 = call i64 @addArgExpr(i64 %104, i64 %103)
	store i64 %105, ptr %0, align 8
	%106 = getelementptr i64, ptr @.STR294, i64 0
	%107 = ptrtoint ptr %106 to i64
	%108 = call i64 @UStrCreate(i64 %107)
	%109 = call i64 @createIntegerExpr(i64 %108)
	%110 = load i64, ptr %expr, align 8
	%111 = call i64 @addArgExpr(i64 %110, i64 %109)
	store i64 %111, ptr %0, align 8
	%112 = load i64, ptr %c2, align 8
	%113 = call i64 @createIntegerExpr(i64 %112)
	%114 = load i64, ptr %expr, align 8
	; load constant 15 into %115
	%115 = add i64 15, 0
	%116 = call i64 @createBinaryExpr(i64 %115, i64 %114, i64 %113)
	%117 = getelementptr i64, ptr %expr, i64 0
	%118 = ptrtoint ptr %117 to i64
	%119 = inttoptr i64 %118 to ptr
	store i64 %116, ptr %119, align 8
	%120  = add i64 %116, 0; bloody hack
	store i64 %116, ptr %0, align 8
	%121 = getelementptr i64, ptr @.STR295, i64 0
	%122 = ptrtoint ptr %121 to i64
	%123 = call i64 @print(i64 %122)
	store i64 %123, ptr %0, align 8
	%124 = load i64, ptr %expr, align 8
	%125 = call i64 @printExprTree(i64 %124)
	store i64 %125, ptr %0, align 8
	; load constant 0 into %126
	%126 = add i64 0, 0
	%127 = call i64 @println(i64 %126)
	store i64 %127, ptr %0, align 8
	%128 = load i64, ptr %expr, align 8
	%129 = call i64 @loadExpr(i64 %128)
	store i64 %129, ptr %0, align 8
	%130 = load i64, ptr %expr, align 8
	%131 = call i64 @releaseExpr(i64 %130)
	store i64 %131, ptr %0, align 8
	%132 = call i64 @genFuncDefEnd()
	store i64 %132, ptr %0, align 8
	br label %.L819
.L819:
	%133= load i64, ptr %0, align 8
	ret i64 %133
}

@.STR295 = global [3 x i8] c"; \00", align 8
@.STR294 = global [2 x i8] c"2\00", align 8
@.STR293 = global [2 x i8] c"4\00", align 8
@.STR292 = global [8 x i8] c"putchar\00", align 8
@.STR291 = global [3 x i8] c"; \00", align 8
@.STR290 = global [3 x i8] c"; \00", align 8
@.STR289 = global [3 x i8] c"; \00", align 8
@.STR288 = global [4 x i8] c"123\00", align 8
@.STR287 = global [5 x i8] c"main\00", align 8
@.STR286 = global [2 x i8] c"x\00", align 8
@.STR285 = global [2 x i8] c"4\00", align 8
@.STR284 = global [2 x i8] c"3\00", align 8
@.STR283 = global [2 x i8] c"2\00", align 8
; function expected
define i64 @expected(i64 %0) {
.L820:
	%kind = alloca i64, align 8
	store i64 %0, ptr %kind, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = load i64, ptr @token, align 8
	%3 = inttoptr i64 %2 to ptr
	%4 = load i64, ptr %3, align 8
	%5 = load i64, ptr %kind, align 8
	%6 = icmp ne i64 %4, %5
	%7 = zext i1 %6 to i64
	%8 = sub i64 %7, 0
	%9 = icmp eq i64 %8, 0
	br i1 %9, label %.L822, label %.L823
.L823:
	%10 = load i64, ptr @token, align 8
	; load constant 16 into %11
	%11 = add i64 16, 0
	%12 = add i64 %10, %11
	%13 = inttoptr i64 %12 to ptr
	%14 = load i64, ptr %13, align 8
	%15 = call i64 @printInt(i64 %14)
	store i64 %15, ptr %1, align 8
	%16 = getelementptr i64, ptr @.STR296, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = call i64 @print(i64 %17)
	store i64 %18, ptr %1, align 8
	%19 = load i64, ptr @token, align 8
	; load constant 24 into %20
	%20 = add i64 24, 0
	%21 = add i64 %19, %20
	%22 = inttoptr i64 %21 to ptr
	%23 = load i64, ptr %22, align 8
	%24 = call i64 @printInt(i64 %23)
	store i64 %24, ptr %1, align 8
	%25 = getelementptr i64, ptr @.STR297, i64 0
	%26 = ptrtoint ptr %25 to i64
	%27 = call i64 @print(i64 %26)
	store i64 %27, ptr %1, align 8
	%28 = load i64, ptr %kind, align 8
	%29 = call i64 @printInt(i64 %28)
	store i64 %29, ptr %1, align 8
	; load constant 0 into %30
	%30 = add i64 0, 0
	%31 = call i64 @println(i64 %30)
	store i64 %31, ptr %1, align 8
	br label %.L821
.L822:
	br label %.L821
.L821:
	br label %.L824
.L824:
	%32= load i64, ptr %1, align 8
	ret i64 %32
}

@.STR297 = global [23 x i8] c" expected token kind: \00", align 8
@.STR296 = global [2 x i8] c".\00", align 8
; function error
define i64 @error(i64 %0) {
.L825:
	%msg = alloca i64, align 8
	store i64 %0, ptr %msg, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%2 = load i64, ptr @token, align 8
	; load constant 16 into %3
	%3 = add i64 16, 0
	%4 = add i64 %2, %3
	%5 = inttoptr i64 %4 to ptr
	%6 = load i64, ptr %5, align 8
	%7 = call i64 @printInt(i64 %6)
	store i64 %7, ptr %1, align 8
	%8 = getelementptr i64, ptr @.STR298, i64 0
	%9 = ptrtoint ptr %8 to i64
	%10 = call i64 @print(i64 %9)
	store i64 %10, ptr %1, align 8
	%11 = load i64, ptr @token, align 8
	; load constant 24 into %12
	%12 = add i64 24, 0
	%13 = add i64 %11, %12
	%14 = inttoptr i64 %13 to ptr
	%15 = load i64, ptr %14, align 8
	%16 = call i64 @printInt(i64 %15)
	store i64 %16, ptr %1, align 8
	%17 = getelementptr i64, ptr @.STR299, i64 0
	%18 = ptrtoint ptr %17 to i64
	%19 = call i64 @print(i64 %18)
	store i64 %19, ptr %1, align 8
	%20 = load i64, ptr %msg, align 8
	%21 = call i64 @println(i64 %20)
	store i64 %21, ptr %1, align 8
	br label %.L826
.L826:
	%22= load i64, ptr %1, align 8
	ret i64 %22
}

@.STR299 = global [9 x i8] c" error: \00", align 8
@.STR298 = global [2 x i8] c".\00", align 8
; function exprKindFromTokenKind
define i64 @exprKindFromTokenKind(i64 %0) {
.L827:
	%kind = alloca i64, align 8
	store i64 %0, ptr %kind, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%exprKind = alloca i64, align 8
	; load constant 0 into %2
	%2 = add i64 0, 0
	; load constant 1 into %3
	%3 = add i64 1, 0
	%4 = sub i64 %2, %3
	%5 = getelementptr i64, ptr %exprKind, i64 0
	%6 = ptrtoint ptr %5 to i64
	%7 = inttoptr i64 %6 to ptr
	store i64 %4, ptr %7, align 8
	%8  = add i64 %4, 0; bloody hack
	store i64 %4, ptr %1, align 8
	%9 = load i64, ptr %kind, align 8
	; load constant 4 into %10
	%10 = add i64 4, 0
	%11 = icmp eq i64 %9, %10
	%12 = zext i1 %11 to i64
	%13 = sub i64 %12, 0
	%14 = icmp eq i64 %13, 0
	br i1 %14, label %.L829, label %.L830
.L830:
	; load constant 7 into %15
	%15 = add i64 7, 0
	%16 = getelementptr i64, ptr %exprKind, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = inttoptr i64 %17 to ptr
	store i64 %15, ptr %18, align 8
	%19  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %1, align 8
	br label %.L828
.L829:
	%20 = load i64, ptr %kind, align 8
	; load constant 7 into %21
	%21 = add i64 7, 0
	%22 = icmp eq i64 %20, %21
	%23 = zext i1 %22 to i64
	%24 = sub i64 %23, 0
	%25 = icmp eq i64 %24, 0
	br i1 %25, label %.L832, label %.L833
.L833:
	; load constant 3 into %26
	%26 = add i64 3, 0
	%27 = getelementptr i64, ptr %exprKind, i64 0
	%28 = ptrtoint ptr %27 to i64
	%29 = inttoptr i64 %28 to ptr
	store i64 %26, ptr %29, align 8
	%30  = add i64 %26, 0; bloody hack
	store i64 %26, ptr %1, align 8
	br label %.L831
.L832:
	%31 = load i64, ptr %kind, align 8
	; load constant 8 into %32
	%32 = add i64 8, 0
	%33 = icmp eq i64 %31, %32
	%34 = zext i1 %33 to i64
	%35 = sub i64 %34, 0
	%36 = icmp eq i64 %35, 0
	br i1 %36, label %.L835, label %.L836
.L836:
	; load constant 4 into %37
	%37 = add i64 4, 0
	%38 = getelementptr i64, ptr %exprKind, i64 0
	%39 = ptrtoint ptr %38 to i64
	%40 = inttoptr i64 %39 to ptr
	store i64 %37, ptr %40, align 8
	%41  = add i64 %37, 0; bloody hack
	store i64 %37, ptr %1, align 8
	br label %.L834
.L835:
	%42 = load i64, ptr %kind, align 8
	; load constant 9 into %43
	%43 = add i64 9, 0
	%44 = icmp eq i64 %42, %43
	%45 = zext i1 %44 to i64
	%46 = sub i64 %45, 0
	%47 = icmp eq i64 %46, 0
	br i1 %47, label %.L838, label %.L839
.L839:
	; load constant 5 into %48
	%48 = add i64 5, 0
	%49 = getelementptr i64, ptr %exprKind, i64 0
	%50 = ptrtoint ptr %49 to i64
	%51 = inttoptr i64 %50 to ptr
	store i64 %48, ptr %51, align 8
	%52  = add i64 %48, 0; bloody hack
	store i64 %48, ptr %1, align 8
	br label %.L837
.L838:
	%53 = load i64, ptr %kind, align 8
	; load constant 10 into %54
	%54 = add i64 10, 0
	%55 = icmp eq i64 %53, %54
	%56 = zext i1 %55 to i64
	%57 = sub i64 %56, 0
	%58 = icmp eq i64 %57, 0
	br i1 %58, label %.L841, label %.L842
.L842:
	; load constant 6 into %59
	%59 = add i64 6, 0
	%60 = getelementptr i64, ptr %exprKind, i64 0
	%61 = ptrtoint ptr %60 to i64
	%62 = inttoptr i64 %61 to ptr
	store i64 %59, ptr %62, align 8
	%63  = add i64 %59, 0; bloody hack
	store i64 %59, ptr %1, align 8
	br label %.L840
.L841:
	%64 = load i64, ptr %kind, align 8
	; load constant 31 into %65
	%65 = add i64 31, 0
	%66 = icmp eq i64 %64, %65
	%67 = zext i1 %66 to i64
	%68 = sub i64 %67, 0
	%69 = icmp eq i64 %68, 0
	br i1 %69, label %.L844, label %.L845
.L845:
	; load constant 8 into %70
	%70 = add i64 8, 0
	%71 = getelementptr i64, ptr %exprKind, i64 0
	%72 = ptrtoint ptr %71 to i64
	%73 = inttoptr i64 %72 to ptr
	store i64 %70, ptr %73, align 8
	%74  = add i64 %70, 0; bloody hack
	store i64 %70, ptr %1, align 8
	br label %.L843
.L844:
	%75 = load i64, ptr %kind, align 8
	; load constant 28 into %76
	%76 = add i64 28, 0
	%77 = icmp eq i64 %75, %76
	%78 = zext i1 %77 to i64
	%79 = sub i64 %78, 0
	%80 = icmp eq i64 %79, 0
	br i1 %80, label %.L847, label %.L848
.L848:
	; load constant 9 into %81
	%81 = add i64 9, 0
	%82 = getelementptr i64, ptr %exprKind, i64 0
	%83 = ptrtoint ptr %82 to i64
	%84 = inttoptr i64 %83 to ptr
	store i64 %81, ptr %84, align 8
	%85  = add i64 %81, 0; bloody hack
	store i64 %81, ptr %1, align 8
	br label %.L846
.L847:
	%86 = load i64, ptr %kind, align 8
	; load constant 30 into %87
	%87 = add i64 30, 0
	%88 = icmp eq i64 %86, %87
	%89 = zext i1 %88 to i64
	%90 = sub i64 %89, 0
	%91 = icmp eq i64 %90, 0
	br i1 %91, label %.L850, label %.L851
.L851:
	; load constant 10 into %92
	%92 = add i64 10, 0
	%93 = getelementptr i64, ptr %exprKind, i64 0
	%94 = ptrtoint ptr %93 to i64
	%95 = inttoptr i64 %94 to ptr
	store i64 %92, ptr %95, align 8
	%96  = add i64 %92, 0; bloody hack
	store i64 %92, ptr %1, align 8
	br label %.L849
.L850:
	%97 = load i64, ptr %kind, align 8
	; load constant 25 into %98
	%98 = add i64 25, 0
	%99 = icmp eq i64 %97, %98
	%100 = zext i1 %99 to i64
	%101 = sub i64 %100, 0
	%102 = icmp eq i64 %101, 0
	br i1 %102, label %.L853, label %.L854
.L854:
	; load constant 11 into %103
	%103 = add i64 11, 0
	%104 = getelementptr i64, ptr %exprKind, i64 0
	%105 = ptrtoint ptr %104 to i64
	%106 = inttoptr i64 %105 to ptr
	store i64 %103, ptr %106, align 8
	%107  = add i64 %103, 0; bloody hack
	store i64 %103, ptr %1, align 8
	br label %.L852
.L853:
	%108 = load i64, ptr %kind, align 8
	; load constant 24 into %109
	%109 = add i64 24, 0
	%110 = icmp eq i64 %108, %109
	%111 = zext i1 %110 to i64
	%112 = sub i64 %111, 0
	%113 = icmp eq i64 %112, 0
	br i1 %113, label %.L856, label %.L857
.L857:
	; load constant 12 into %114
	%114 = add i64 12, 0
	%115 = getelementptr i64, ptr %exprKind, i64 0
	%116 = ptrtoint ptr %115 to i64
	%117 = inttoptr i64 %116 to ptr
	store i64 %114, ptr %117, align 8
	%118  = add i64 %114, 0; bloody hack
	store i64 %114, ptr %1, align 8
	br label %.L855
.L856:
	%119 = load i64, ptr %kind, align 8
	; load constant 26 into %120
	%120 = add i64 26, 0
	%121 = icmp eq i64 %119, %120
	%122 = zext i1 %121 to i64
	%123 = sub i64 %122, 0
	%124 = icmp eq i64 %123, 0
	br i1 %124, label %.L859, label %.L860
.L860:
	; load constant 13 into %125
	%125 = add i64 13, 0
	%126 = getelementptr i64, ptr %exprKind, i64 0
	%127 = ptrtoint ptr %126 to i64
	%128 = inttoptr i64 %127 to ptr
	store i64 %125, ptr %128, align 8
	%129  = add i64 %125, 0; bloody hack
	store i64 %125, ptr %1, align 8
	br label %.L858
.L859:
	%130 = load i64, ptr %kind, align 8
	; load constant 27 into %131
	%131 = add i64 27, 0
	%132 = icmp eq i64 %130, %131
	%133 = zext i1 %132 to i64
	%134 = sub i64 %133, 0
	%135 = icmp eq i64 %134, 0
	br i1 %135, label %.L862, label %.L863
.L863:
	; load constant 14 into %136
	%136 = add i64 14, 0
	%137 = getelementptr i64, ptr %exprKind, i64 0
	%138 = ptrtoint ptr %137 to i64
	%139 = inttoptr i64 %138 to ptr
	store i64 %136, ptr %139, align 8
	%140  = add i64 %136, 0; bloody hack
	store i64 %136, ptr %1, align 8
	br label %.L861
.L862:
	%141 = load i64, ptr %kind, align 8
	; load constant 34 into %142
	%142 = add i64 34, 0
	%143 = icmp eq i64 %141, %142
	%144 = zext i1 %143 to i64
	%145 = sub i64 %144, 0
	%146 = icmp eq i64 %145, 0
	br i1 %146, label %.L865, label %.L866
.L866:
	; load constant 15 into %147
	%147 = add i64 15, 0
	%148 = getelementptr i64, ptr %exprKind, i64 0
	%149 = ptrtoint ptr %148 to i64
	%150 = inttoptr i64 %149 to ptr
	store i64 %147, ptr %150, align 8
	%151  = add i64 %147, 0; bloody hack
	store i64 %147, ptr %1, align 8
	br label %.L864
.L865:
	%152 = load i64, ptr %kind, align 8
	; load constant 36 into %153
	%153 = add i64 36, 0
	%154 = icmp eq i64 %152, %153
	%155 = zext i1 %154 to i64
	%156 = sub i64 %155, 0
	%157 = icmp eq i64 %156, 0
	br i1 %157, label %.L868, label %.L869
.L869:
	; load constant 16 into %158
	%158 = add i64 16, 0
	%159 = getelementptr i64, ptr %exprKind, i64 0
	%160 = ptrtoint ptr %159 to i64
	%161 = inttoptr i64 %160 to ptr
	store i64 %158, ptr %161, align 8
	%162  = add i64 %158, 0; bloody hack
	store i64 %158, ptr %1, align 8
	br label %.L867
.L868:
	%163 = getelementptr i64, ptr @.STR300, i64 0
	%164 = ptrtoint ptr %163 to i64
	%165 = call i64 @print(i64 %164)
	store i64 %165, ptr %1, align 8
	%166 = load i64, ptr %kind, align 8
	%167 = call i64 @printInt(i64 %166)
	store i64 %167, ptr %1, align 8
	; load constant 0 into %168
	%168 = add i64 0, 0
	%169 = call i64 @println(i64 %168)
	store i64 %169, ptr %1, align 8
	%170 = getelementptr i64, ptr @.STR301, i64 0
	%171 = ptrtoint ptr %170 to i64
	%172 = call i64 @println(i64 %171)
	store i64 %172, ptr %1, align 8
	br label %.L867
.L867:
	br label %.L864
.L864:
	br label %.L861
.L861:
	br label %.L858
.L858:
	br label %.L855
.L855:
	br label %.L852
.L852:
	br label %.L849
.L849:
	br label %.L846
.L846:
	br label %.L843
.L843:
	br label %.L840
.L840:
	br label %.L837
.L837:
	br label %.L834
.L834:
	br label %.L831
.L831:
	br label %.L828
.L828:
	%173 = load i64, ptr %exprKind, align 8
	store i64 %173, ptr %1, align 8
	br label %.L870
.L870:
	%174= load i64, ptr %1, align 8
	ret i64 %174
}

@.STR301 = global [36 x i8] c"exprKindFromToken: case not handled\00", align 8
@.STR300 = global [8 x i8] c"kind = \00", align 8
; function tokenKindPrec
define i64 @tokenKindPrec(i64 %0) {
.L871:
	%kind = alloca i64, align 8
	store i64 %0, ptr %kind, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%p = alloca i64, align 8
	; load constant 0 into %2
	%2 = add i64 0, 0
	%3 = getelementptr i64, ptr %p, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %1, align 8
	%7 = load i64, ptr %kind, align 8
	; load constant 9 into %8
	%8 = add i64 9, 0
	%9 = icmp eq i64 %7, %8
	%10 = zext i1 %9 to i64
	%11 = sub i64 %10, 0
	%12 = icmp eq i64 %11, 0
	br i1 %12, label %.L873, label %.L874
.L874:
	; load constant 13 into %13
	%13 = add i64 13, 0
	%14 = getelementptr i64, ptr %p, i64 0
	%15 = ptrtoint ptr %14 to i64
	%16 = inttoptr i64 %15 to ptr
	store i64 %13, ptr %16, align 8
	%17  = add i64 %13, 0; bloody hack
	store i64 %13, ptr %1, align 8
	br label %.L872
.L873:
	%18 = load i64, ptr %kind, align 8
	; load constant 10 into %19
	%19 = add i64 10, 0
	%20 = icmp eq i64 %18, %19
	%21 = zext i1 %20 to i64
	%22 = sub i64 %21, 0
	%23 = icmp eq i64 %22, 0
	br i1 %23, label %.L876, label %.L877
.L877:
	; load constant 13 into %24
	%24 = add i64 13, 0
	%25 = getelementptr i64, ptr %p, i64 0
	%26 = ptrtoint ptr %25 to i64
	%27 = inttoptr i64 %26 to ptr
	store i64 %24, ptr %27, align 8
	%28  = add i64 %24, 0; bloody hack
	store i64 %24, ptr %1, align 8
	br label %.L875
.L876:
	%29 = load i64, ptr %kind, align 8
	; load constant 31 into %30
	%30 = add i64 31, 0
	%31 = icmp eq i64 %29, %30
	%32 = zext i1 %31 to i64
	%33 = sub i64 %32, 0
	%34 = icmp eq i64 %33, 0
	br i1 %34, label %.L879, label %.L880
.L880:
	; load constant 13 into %35
	%35 = add i64 13, 0
	%36 = getelementptr i64, ptr %p, i64 0
	%37 = ptrtoint ptr %36 to i64
	%38 = inttoptr i64 %37 to ptr
	store i64 %35, ptr %38, align 8
	%39  = add i64 %35, 0; bloody hack
	store i64 %35, ptr %1, align 8
	br label %.L878
.L879:
	%40 = load i64, ptr %kind, align 8
	; load constant 7 into %41
	%41 = add i64 7, 0
	%42 = icmp eq i64 %40, %41
	%43 = zext i1 %42 to i64
	%44 = sub i64 %43, 0
	%45 = icmp eq i64 %44, 0
	br i1 %45, label %.L882, label %.L883
.L883:
	; load constant 12 into %46
	%46 = add i64 12, 0
	%47 = getelementptr i64, ptr %p, i64 0
	%48 = ptrtoint ptr %47 to i64
	%49 = inttoptr i64 %48 to ptr
	store i64 %46, ptr %49, align 8
	%50  = add i64 %46, 0; bloody hack
	store i64 %46, ptr %1, align 8
	br label %.L881
.L882:
	%51 = load i64, ptr %kind, align 8
	; load constant 8 into %52
	%52 = add i64 8, 0
	%53 = icmp eq i64 %51, %52
	%54 = zext i1 %53 to i64
	%55 = sub i64 %54, 0
	%56 = icmp eq i64 %55, 0
	br i1 %56, label %.L885, label %.L886
.L886:
	; load constant 12 into %57
	%57 = add i64 12, 0
	%58 = getelementptr i64, ptr %p, i64 0
	%59 = ptrtoint ptr %58 to i64
	%60 = inttoptr i64 %59 to ptr
	store i64 %57, ptr %60, align 8
	%61  = add i64 %57, 0; bloody hack
	store i64 %57, ptr %1, align 8
	br label %.L884
.L885:
	%62 = load i64, ptr %kind, align 8
	; load constant 26 into %63
	%63 = add i64 26, 0
	%64 = icmp eq i64 %62, %63
	%65 = zext i1 %64 to i64
	%66 = sub i64 %65, 0
	%67 = icmp eq i64 %66, 0
	br i1 %67, label %.L888, label %.L889
.L889:
	; load constant 10 into %68
	%68 = add i64 10, 0
	%69 = getelementptr i64, ptr %p, i64 0
	%70 = ptrtoint ptr %69 to i64
	%71 = inttoptr i64 %70 to ptr
	store i64 %68, ptr %71, align 8
	%72  = add i64 %68, 0; bloody hack
	store i64 %68, ptr %1, align 8
	br label %.L887
.L888:
	%73 = load i64, ptr %kind, align 8
	; load constant 27 into %74
	%74 = add i64 27, 0
	%75 = icmp eq i64 %73, %74
	%76 = zext i1 %75 to i64
	%77 = sub i64 %76, 0
	%78 = icmp eq i64 %77, 0
	br i1 %78, label %.L891, label %.L892
.L892:
	; load constant 10 into %79
	%79 = add i64 10, 0
	%80 = getelementptr i64, ptr %p, i64 0
	%81 = ptrtoint ptr %80 to i64
	%82 = inttoptr i64 %81 to ptr
	store i64 %79, ptr %82, align 8
	%83  = add i64 %79, 0; bloody hack
	store i64 %79, ptr %1, align 8
	br label %.L890
.L891:
	%84 = load i64, ptr %kind, align 8
	; load constant 25 into %85
	%85 = add i64 25, 0
	%86 = icmp eq i64 %84, %85
	%87 = zext i1 %86 to i64
	%88 = sub i64 %87, 0
	%89 = icmp eq i64 %88, 0
	br i1 %89, label %.L894, label %.L895
.L895:
	; load constant 10 into %90
	%90 = add i64 10, 0
	%91 = getelementptr i64, ptr %p, i64 0
	%92 = ptrtoint ptr %91 to i64
	%93 = inttoptr i64 %92 to ptr
	store i64 %90, ptr %93, align 8
	%94  = add i64 %90, 0; bloody hack
	store i64 %90, ptr %1, align 8
	br label %.L893
.L894:
	%95 = load i64, ptr %kind, align 8
	; load constant 24 into %96
	%96 = add i64 24, 0
	%97 = icmp eq i64 %95, %96
	%98 = zext i1 %97 to i64
	%99 = sub i64 %98, 0
	%100 = icmp eq i64 %99, 0
	br i1 %100, label %.L897, label %.L898
.L898:
	; load constant 10 into %101
	%101 = add i64 10, 0
	%102 = getelementptr i64, ptr %p, i64 0
	%103 = ptrtoint ptr %102 to i64
	%104 = inttoptr i64 %103 to ptr
	store i64 %101, ptr %104, align 8
	%105  = add i64 %101, 0; bloody hack
	store i64 %101, ptr %1, align 8
	br label %.L896
.L897:
	%106 = load i64, ptr %kind, align 8
	; load constant 28 into %107
	%107 = add i64 28, 0
	%108 = icmp eq i64 %106, %107
	%109 = zext i1 %108 to i64
	%110 = sub i64 %109, 0
	%111 = icmp eq i64 %110, 0
	br i1 %111, label %.L900, label %.L901
.L901:
	; load constant 9 into %112
	%112 = add i64 9, 0
	%113 = getelementptr i64, ptr %p, i64 0
	%114 = ptrtoint ptr %113 to i64
	%115 = inttoptr i64 %114 to ptr
	store i64 %112, ptr %115, align 8
	%116  = add i64 %112, 0; bloody hack
	store i64 %112, ptr %1, align 8
	br label %.L899
.L900:
	%117 = load i64, ptr %kind, align 8
	; load constant 30 into %118
	%118 = add i64 30, 0
	%119 = icmp eq i64 %117, %118
	%120 = zext i1 %119 to i64
	%121 = sub i64 %120, 0
	%122 = icmp eq i64 %121, 0
	br i1 %122, label %.L903, label %.L904
.L904:
	; load constant 9 into %123
	%123 = add i64 9, 0
	%124 = getelementptr i64, ptr %p, i64 0
	%125 = ptrtoint ptr %124 to i64
	%126 = inttoptr i64 %125 to ptr
	store i64 %123, ptr %126, align 8
	%127  = add i64 %123, 0; bloody hack
	store i64 %123, ptr %1, align 8
	br label %.L902
.L903:
	%128 = load i64, ptr %kind, align 8
	; load constant 34 into %129
	%129 = add i64 34, 0
	%130 = icmp eq i64 %128, %129
	%131 = zext i1 %130 to i64
	%132 = sub i64 %131, 0
	%133 = icmp eq i64 %132, 0
	br i1 %133, label %.L906, label %.L907
.L907:
	; load constant 5 into %134
	%134 = add i64 5, 0
	%135 = getelementptr i64, ptr %p, i64 0
	%136 = ptrtoint ptr %135 to i64
	%137 = inttoptr i64 %136 to ptr
	store i64 %134, ptr %137, align 8
	%138  = add i64 %134, 0; bloody hack
	store i64 %134, ptr %1, align 8
	br label %.L905
.L906:
	%139 = load i64, ptr %kind, align 8
	; load constant 36 into %140
	%140 = add i64 36, 0
	%141 = icmp eq i64 %139, %140
	%142 = zext i1 %141 to i64
	%143 = sub i64 %142, 0
	%144 = icmp eq i64 %143, 0
	br i1 %144, label %.L909, label %.L910
.L910:
	; load constant 4 into %145
	%145 = add i64 4, 0
	%146 = getelementptr i64, ptr %p, i64 0
	%147 = ptrtoint ptr %146 to i64
	%148 = inttoptr i64 %147 to ptr
	store i64 %145, ptr %148, align 8
	%149  = add i64 %145, 0; bloody hack
	store i64 %145, ptr %1, align 8
	br label %.L908
.L909:
	br label %.L908
.L908:
	br label %.L905
.L905:
	br label %.L902
.L902:
	br label %.L899
.L899:
	br label %.L896
.L896:
	br label %.L893
.L893:
	br label %.L890
.L890:
	br label %.L887
.L887:
	br label %.L884
.L884:
	br label %.L881
.L881:
	br label %.L878
.L878:
	br label %.L875
.L875:
	br label %.L872
.L872:
	br label %.L911
.L911:
	%150= load i64, ptr %1, align 8
	ret i64 %150
}

; function parseExpr
define i64 @parseExpr() {
.L912:
	%0 = alloca i64, align 8 ; ptr to ret val
	%left = alloca i64, align 8
	; load constant 1 into %1
	%1 = add i64 1, 0
	%2 = call i64 @parseBinary(i64 %1)
	%3 = getelementptr i64, ptr %left, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %0, align 8
	%7 = load i64, ptr %left, align 8
	; load constant 0 into %8
	%8 = add i64 0, 0
	%9 = icmp eq i64 %7, %8
	%10 = zext i1 %9 to i64
	%11 = sub i64 %10, 0
	%12 = icmp eq i64 %11, 0
	br i1 %12, label %.L914, label %.L915
.L915:
	; load constant 0 into %13
	%13 = add i64 0, 0
	%14 = getelementptr i64, ptr %left, i64 0
	%15 = ptrtoint ptr %14 to i64
	%16 = inttoptr i64 %15 to ptr
	store i64 %13, ptr %16, align 8
	%17  = add i64 %13, 0; bloody hack
	store i64 %13, ptr %0, align 8
	br label %.L913
.L914:
	br label %.L916
.L916:
	%18 = load i64, ptr @token, align 8
	%19 = inttoptr i64 %18 to ptr
	%20 = load i64, ptr %19, align 8
	; load constant 4 into %21
	%21 = add i64 4, 0
	%22 = icmp eq i64 %20, %21
	%23 = zext i1 %22 to i64
	%24 = sub i64 %23, 0
	%25 = icmp eq i64 %24, 0
	br i1 %25, label %.L917, label %.L918
.L918:
	%kind = alloca i64, align 8
	%26 = load i64, ptr @token, align 8
	%27 = inttoptr i64 %26 to ptr
	%28 = load i64, ptr %27, align 8
	%29 = getelementptr i64, ptr %kind, i64 0
	%30 = ptrtoint ptr %29 to i64
	%31 = inttoptr i64 %30 to ptr
	store i64 %28, ptr %31, align 8
	%32  = add i64 %28, 0; bloody hack
	store i64 %28, ptr %0, align 8
	%33 = call i64 @getToken()
	store i64 %33, ptr %0, align 8
	%right = alloca i64, align 8
	%34 = call i64 @parseExpr()
	%35 = getelementptr i64, ptr %right, i64 0
	%36 = ptrtoint ptr %35 to i64
	%37 = inttoptr i64 %36 to ptr
	store i64 %34, ptr %37, align 8
	%38  = add i64 %34, 0; bloody hack
	store i64 %34, ptr %0, align 8
	%39 = load i64, ptr %right, align 8
	; load constant 0 into %40
	%40 = add i64 0, 0
	%41 = icmp eq i64 %39, %40
	%42 = zext i1 %41 to i64
	%43 = sub i64 %42, 0
	%44 = icmp eq i64 %43, 0
	br i1 %44, label %.L920, label %.L921
.L921:
	%45 = getelementptr i64, ptr @.STR302, i64 0
	%46 = ptrtoint ptr %45 to i64
	%47 = call i64 @error(i64 %46)
	store i64 %47, ptr %0, align 8
	br label %.L919
.L920:
	br label %.L919
.L919:
	%48 = load i64, ptr %right, align 8
	%49 = load i64, ptr %left, align 8
	%50 = load i64, ptr %kind, align 8
	%51 = call i64 @exprKindFromTokenKind(i64 %50)
	%52 = call i64 @createBinaryExpr(i64 %51, i64 %49, i64 %48)
	%53 = getelementptr i64, ptr %left, i64 0
	%54 = ptrtoint ptr %53 to i64
	%55 = inttoptr i64 %54 to ptr
	store i64 %52, ptr %55, align 8
	%56  = add i64 %52, 0; bloody hack
	store i64 %52, ptr %0, align 8
	br label %.L916
.L917:
	br label %.L913
.L913:
	%57 = load i64, ptr %left, align 8
	store i64 %57, ptr %0, align 8
	br label %.L922
.L922:
	%58= load i64, ptr %0, align 8
	ret i64 %58
}

@.STR302 = global [20 x i8] c"expected expression\00", align 8
; function parseBinary
define i64 @parseBinary(i64 %0) {
.L923:
	%prec = alloca i64, align 8
	store i64 %0, ptr %prec, align 8
	%1 = alloca i64, align 8 ; ptr to ret val
	%left = alloca i64, align 8
	%2 = call i64 @parsePrefix()
	%3 = getelementptr i64, ptr %left, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = inttoptr i64 %4 to ptr
	store i64 %2, ptr %5, align 8
	%6  = add i64 %2, 0; bloody hack
	store i64 %2, ptr %1, align 8
	%7 = load i64, ptr %left, align 8
	; load constant 0 into %8
	%8 = add i64 0, 0
	%9 = icmp eq i64 %7, %8
	%10 = zext i1 %9 to i64
	%11 = sub i64 %10, 0
	%12 = icmp eq i64 %11, 0
	br i1 %12, label %.L925, label %.L926
.L926:
	; load constant 0 into %13
	%13 = add i64 0, 0
	%14 = getelementptr i64, ptr %left, i64 0
	%15 = ptrtoint ptr %14 to i64
	%16 = inttoptr i64 %15 to ptr
	store i64 %13, ptr %16, align 8
	%17  = add i64 %13, 0; bloody hack
	store i64 %13, ptr %1, align 8
	br label %.L924
.L925:
	%p = alloca i64, align 8
	%18 = load i64, ptr @token, align 8
	%19 = inttoptr i64 %18 to ptr
	%20 = load i64, ptr %19, align 8
	%21 = call i64 @tokenKindPrec(i64 %20)
	%22 = getelementptr i64, ptr %p, i64 0
	%23 = ptrtoint ptr %22 to i64
	%24 = inttoptr i64 %23 to ptr
	store i64 %21, ptr %24, align 8
	%25  = add i64 %21, 0; bloody hack
	store i64 %21, ptr %1, align 8
	br label %.L927
.L927:
	%26 = load i64, ptr %p, align 8
	%27 = load i64, ptr %prec, align 8
	%28 = icmp sge i64 %26, %27
	%29 = zext i1 %28 to i64
	%30 = sub i64 %29, 0
	%31 = icmp eq i64 %30, 0
	br i1 %31, label %.L928, label %.L929
.L929:
	br label %.L930
.L930:
	%32 = load i64, ptr @token, align 8
	%33 = inttoptr i64 %32 to ptr
	%34 = load i64, ptr %33, align 8
	%35 = call i64 @tokenKindPrec(i64 %34)
	%36 = load i64, ptr %p, align 8
	%37 = icmp eq i64 %35, %36
	%38 = zext i1 %37 to i64
	%39 = sub i64 %38, 0
	%40 = icmp eq i64 %39, 0
	br i1 %40, label %.L931, label %.L932
.L932:
	%kind = alloca i64, align 8
	%41 = load i64, ptr @token, align 8
	%42 = inttoptr i64 %41 to ptr
	%43 = load i64, ptr %42, align 8
	%44 = getelementptr i64, ptr %kind, i64 0
	%45 = ptrtoint ptr %44 to i64
	%46 = inttoptr i64 %45 to ptr
	store i64 %43, ptr %46, align 8
	%47  = add i64 %43, 0; bloody hack
	store i64 %43, ptr %1, align 8
	%48 = call i64 @getToken()
	store i64 %48, ptr %1, align 8
	%right = alloca i64, align 8
	%49 = load i64, ptr %p, align 8
	; load constant 1 into %50
	%50 = add i64 1, 0
	%51 = add i64 %49, %50
	%52 = call i64 @parseBinary(i64 %51)
	%53 = getelementptr i64, ptr %right, i64 0
	%54 = ptrtoint ptr %53 to i64
	%55 = inttoptr i64 %54 to ptr
	store i64 %52, ptr %55, align 8
	%56  = add i64 %52, 0; bloody hack
	store i64 %52, ptr %1, align 8
	%57 = load i64, ptr %right, align 8
	; load constant 0 into %58
	%58 = add i64 0, 0
	%59 = icmp eq i64 %57, %58
	%60 = zext i1 %59 to i64
	%61 = sub i64 %60, 0
	%62 = icmp eq i64 %61, 0
	br i1 %62, label %.L934, label %.L935
.L935:
	%63 = getelementptr i64, ptr @.STR303, i64 0
	%64 = ptrtoint ptr %63 to i64
	%65 = call i64 @error(i64 %64)
	store i64 %65, ptr %1, align 8
	br label %.L933
.L934:
	br label %.L933
.L933:
	%66 = load i64, ptr %right, align 8
	%67 = load i64, ptr %left, align 8
	%68 = load i64, ptr %kind, align 8
	%69 = call i64 @exprKindFromTokenKind(i64 %68)
	%70 = call i64 @createBinaryExpr(i64 %69, i64 %67, i64 %66)
	%71 = getelementptr i64, ptr %left, i64 0
	%72 = ptrtoint ptr %71 to i64
	%73 = inttoptr i64 %72 to ptr
	store i64 %70, ptr %73, align 8
	%74  = add i64 %70, 0; bloody hack
	store i64 %70, ptr %1, align 8
	br label %.L930
.L931:
	%75 = load i64, ptr %p, align 8
	; load constant 1 into %76
	%76 = add i64 1, 0
	%77 = sub i64 %75, %76
	%78 = getelementptr i64, ptr %p, i64 0
	%79 = ptrtoint ptr %78 to i64
	%80 = inttoptr i64 %79 to ptr
	store i64 %77, ptr %80, align 8
	%81  = add i64 %77, 0; bloody hack
	store i64 %77, ptr %1, align 8
	br label %.L927
.L928:
	br label %.L924
.L924:
	%82 = load i64, ptr %left, align 8
	store i64 %82, ptr %1, align 8
	br label %.L936
.L936:
	%83= load i64, ptr %1, align 8
	ret i64 %83
}

@.STR303 = global [22 x i8] c"expression expected\n\00", align 8
; function parsePrefix
define i64 @parsePrefix() {
.L937:
	%0 = alloca i64, align 8 ; ptr to ret val
	%expr = alloca i64, align 8
	%1 = load i64, ptr @token, align 8
	%2 = inttoptr i64 %1 to ptr
	%3 = load i64, ptr %2, align 8
	; load constant 29 into %4
	%4 = add i64 29, 0
	%5 = icmp eq i64 %3, %4
	%6 = zext i1 %5 to i64
	%7 = sub i64 %6, 0
	%8 = icmp eq i64 %7, 0
	br i1 %8, label %.L939, label %.L940
.L940:
	%9 = call i64 @getToken()
	store i64 %9, ptr %0, align 8
	%10 = getelementptr i64, ptr @.STR304, i64 0
	%11 = ptrtoint ptr %10 to i64
	%12 = call i64 @UStrCreate(i64 %11)
	%13 = call i64 @createIntegerExpr(i64 %12)
	%14 = call i64 @parsePrefix()
	; load constant 9 into %15
	%15 = add i64 9, 0
	%16 = call i64 @createBinaryExpr(i64 %15, i64 %14, i64 %13)
	%17 = getelementptr i64, ptr %expr, i64 0
	%18 = ptrtoint ptr %17 to i64
	%19 = inttoptr i64 %18 to ptr
	store i64 %16, ptr %19, align 8
	%20  = add i64 %16, 0; bloody hack
	store i64 %16, ptr %0, align 8
	br label %.L938
.L939:
	%21 = load i64, ptr @token, align 8
	%22 = inttoptr i64 %21 to ptr
	%23 = load i64, ptr %22, align 8
	; load constant 8 into %24
	%24 = add i64 8, 0
	%25 = icmp eq i64 %23, %24
	%26 = zext i1 %25 to i64
	%27 = sub i64 %26, 0
	%28 = icmp eq i64 %27, 0
	br i1 %28, label %.L942, label %.L943
.L943:
	%29 = call i64 @getToken()
	store i64 %29, ptr %0, align 8
	%30 = call i64 @parsePrefix()
	%31 = getelementptr i64, ptr @.STR305, i64 0
	%32 = ptrtoint ptr %31 to i64
	%33 = call i64 @UStrCreate(i64 %32)
	%34 = call i64 @createIntegerExpr(i64 %33)
	; load constant 4 into %35
	%35 = add i64 4, 0
	%36 = call i64 @createBinaryExpr(i64 %35, i64 %34, i64 %30)
	%37 = getelementptr i64, ptr %expr, i64 0
	%38 = ptrtoint ptr %37 to i64
	%39 = inttoptr i64 %38 to ptr
	store i64 %36, ptr %39, align 8
	%40  = add i64 %36, 0; bloody hack
	store i64 %36, ptr %0, align 8
	br label %.L941
.L942:
	%41 = load i64, ptr @token, align 8
	%42 = inttoptr i64 %41 to ptr
	%43 = load i64, ptr %42, align 8
	; load constant 33 into %44
	%44 = add i64 33, 0
	%45 = icmp eq i64 %43, %44
	%46 = zext i1 %45 to i64
	%47 = sub i64 %46, 0
	%48 = icmp eq i64 %47, 0
	br i1 %48, label %.L945, label %.L946
.L946:
	%49 = call i64 @getToken()
	store i64 %49, ptr %0, align 8
	%50 = call i64 @parsePrefix()
	; load constant 0 into %51
	%51 = add i64 0, 0
	%52 = call i64 @createUnaryExpr(i64 %51, i64 %50)
	%53 = getelementptr i64, ptr %expr, i64 0
	%54 = ptrtoint ptr %53 to i64
	%55 = inttoptr i64 %54 to ptr
	store i64 %52, ptr %55, align 8
	%56  = add i64 %52, 0; bloody hack
	store i64 %52, ptr %0, align 8
	br label %.L944
.L945:
	%57 = load i64, ptr @token, align 8
	%58 = inttoptr i64 %57 to ptr
	%59 = load i64, ptr %58, align 8
	; load constant 9 into %60
	%60 = add i64 9, 0
	%61 = icmp eq i64 %59, %60
	%62 = zext i1 %61 to i64
	%63 = sub i64 %62, 0
	%64 = icmp eq i64 %63, 0
	br i1 %64, label %.L948, label %.L949
.L949:
	%65 = call i64 @getToken()
	store i64 %65, ptr %0, align 8
	%66 = call i64 @parsePrefix()
	; load constant 1 into %67
	%67 = add i64 1, 0
	%68 = call i64 @createUnaryExpr(i64 %67, i64 %66)
	%69 = getelementptr i64, ptr %expr, i64 0
	%70 = ptrtoint ptr %69 to i64
	%71 = inttoptr i64 %70 to ptr
	store i64 %68, ptr %71, align 8
	%72  = add i64 %68, 0; bloody hack
	store i64 %68, ptr %0, align 8
	br label %.L947
.L948:
	%73 = load i64, ptr @token, align 8
	%74 = inttoptr i64 %73 to ptr
	%75 = load i64, ptr %74, align 8
	; load constant 32 into %76
	%76 = add i64 32, 0
	%77 = icmp eq i64 %75, %76
	%78 = zext i1 %77 to i64
	%79 = sub i64 %78, 0
	%80 = icmp eq i64 %79, 0
	br i1 %80, label %.L951, label %.L952
.L952:
	%81 = call i64 @getToken()
	store i64 %81, ptr %0, align 8
	%82 = call i64 @parsePrefix()
	; load constant 2 into %83
	%83 = add i64 2, 0
	%84 = call i64 @createUnaryExpr(i64 %83, i64 %82)
	%85 = getelementptr i64, ptr %expr, i64 0
	%86 = ptrtoint ptr %85 to i64
	%87 = inttoptr i64 %86 to ptr
	store i64 %84, ptr %87, align 8
	%88  = add i64 %84, 0; bloody hack
	store i64 %84, ptr %0, align 8
	br label %.L950
.L951:
	%89 = call i64 @parseFactor()
	%90 = getelementptr i64, ptr %expr, i64 0
	%91 = ptrtoint ptr %90 to i64
	%92 = inttoptr i64 %91 to ptr
	store i64 %89, ptr %92, align 8
	%93  = add i64 %89, 0; bloody hack
	store i64 %89, ptr %0, align 8
	br label %.L950
.L950:
	br label %.L947
.L947:
	br label %.L944
.L944:
	br label %.L941
.L941:
	br label %.L938
.L938:
	%94 = load i64, ptr %expr, align 8
	store i64 %94, ptr %0, align 8
	br label %.L953
.L953:
	%95= load i64, ptr %0, align 8
	ret i64 %95
}

@.STR305 = global [2 x i8] c"0\00", align 8
@.STR304 = global [2 x i8] c"0\00", align 8
; function parseFactor
define i64 @parseFactor() {
.L954:
	%0 = alloca i64, align 8 ; ptr to ret val
	%expr = alloca i64, align 8
	%ident = alloca i64, align 8
	%callExpr = alloca i64, align 8
	%argExpr = alloca i64, align 8
	%.TMP28 = alloca i64, align 8
	%1 = load i64, ptr @token, align 8
	%2 = inttoptr i64 %1 to ptr
	%3 = load i64, ptr %2, align 8
	; load constant 2 into %4
	%4 = add i64 2, 0
	%5 = icmp eq i64 %3, %4
	%6 = zext i1 %5 to i64
	%7 = sub i64 %6, 0
	%8 = icmp eq i64 %7, 0
	br i1 %8, label %.L958, label %.L960
.L960:
	%9 = getelementptr i64, ptr %.TMP28, i64 0
	%10 = ptrtoint ptr %9 to i64
	; load constant 1 into %11
	%11 = add i64 1, 0
	%12 = inttoptr i64 %10 to ptr
	store i64 %11, ptr %12, align 8
	%13  = add i64 %11, 0; bloody hack
	br label %.L957
.L958:
	%14 = load i64, ptr @token, align 8
	%15 = inttoptr i64 %14 to ptr
	%16 = load i64, ptr %15, align 8
	; load constant 16 into %17
	%17 = add i64 16, 0
	%18 = icmp eq i64 %16, %17
	%19 = zext i1 %18 to i64
	%20 = sub i64 %19, 0
	%21 = icmp ne i64 %20, 0
	br i1 %21, label %.L959, label %.L961
.L961:
	%22 = getelementptr i64, ptr %.TMP28, i64 0
	%23 = ptrtoint ptr %22 to i64
	; load constant 0 into %24
	%24 = add i64 0, 0
	%25 = inttoptr i64 %23 to ptr
	store i64 %24, ptr %25, align 8
	%26  = add i64 %24, 0; bloody hack
	br label %.L957
.L959:
	%27 = getelementptr i64, ptr %.TMP28, i64 0
	%28 = ptrtoint ptr %27 to i64
	; load constant 1 into %29
	%29 = add i64 1, 0
	%30 = inttoptr i64 %28 to ptr
	store i64 %29, ptr %30, align 8
	%31  = add i64 %29, 0; bloody hack
	br label %.L957
.L957:
	%32 = getelementptr i64, ptr %.TMP28, i64 0
	%33 = ptrtoint ptr %32 to i64
	%34 = inttoptr i64 %33 to ptr
	%35 = load i64, ptr %34, align 8
	%36 = sub i64 %35, 0
	%37 = icmp eq i64 %36, 0
	br i1 %37, label %.L956, label %.L962
.L962:
	%38 = load i64, ptr @token, align 8
	; load constant 8 into %39
	%39 = add i64 8, 0
	%40 = add i64 %38, %39
	%41 = inttoptr i64 %40 to ptr
	%42 = load i64, ptr %41, align 8
	%43 = call i64 @createIntegerExpr(i64 %42)
	%44 = getelementptr i64, ptr %expr, i64 0
	%45 = ptrtoint ptr %44 to i64
	%46 = inttoptr i64 %45 to ptr
	store i64 %43, ptr %46, align 8
	%47  = add i64 %43, 0; bloody hack
	store i64 %43, ptr %0, align 8
	%48 = call i64 @getToken()
	store i64 %48, ptr %0, align 8
	br label %.L955
.L956:
	%49 = load i64, ptr @token, align 8
	%50 = inttoptr i64 %49 to ptr
	%51 = load i64, ptr %50, align 8
	; load constant 15 into %52
	%52 = add i64 15, 0
	%53 = icmp eq i64 %51, %52
	%54 = zext i1 %53 to i64
	%55 = sub i64 %54, 0
	%56 = icmp eq i64 %55, 0
	br i1 %56, label %.L964, label %.L965
.L965:
	%57 = load i64, ptr @token, align 8
	; load constant 8 into %58
	%58 = add i64 8, 0
	%59 = add i64 %57, %58
	%60 = inttoptr i64 %59 to ptr
	%61 = load i64, ptr %60, align 8
	%62 = call i64 @genDefString(i64 %61)
	%63 = getelementptr i64, ptr %ident, i64 0
	%64 = ptrtoint ptr %63 to i64
	%65 = inttoptr i64 %64 to ptr
	store i64 %62, ptr %65, align 8
	%66  = add i64 %62, 0; bloody hack
	store i64 %62, ptr %0, align 8
	%67 = call i64 @getToken()
	store i64 %67, ptr %0, align 8
	%68 = load i64, ptr %ident, align 8
	%69 = call i64 @symtabAddGlobal(i64 %68)
	store i64 %69, ptr %0, align 8
	%70 = load i64, ptr %ident, align 8
	%71 = call i64 @createIdentifierExpr(i64 %70)
	; load constant 0 into %72
	%72 = add i64 0, 0
	%73 = call i64 @createUnaryExpr(i64 %72, i64 %71)
	%74 = getelementptr i64, ptr %expr, i64 0
	%75 = ptrtoint ptr %74 to i64
	%76 = inttoptr i64 %75 to ptr
	store i64 %73, ptr %76, align 8
	%77  = add i64 %73, 0; bloody hack
	store i64 %73, ptr %0, align 8
	br label %.L963
.L964:
	%78 = load i64, ptr @token, align 8
	%79 = inttoptr i64 %78 to ptr
	%80 = load i64, ptr %79, align 8
	; load constant 3 into %81
	%81 = add i64 3, 0
	%82 = icmp eq i64 %80, %81
	%83 = zext i1 %82 to i64
	%84 = sub i64 %83, 0
	%85 = icmp eq i64 %84, 0
	br i1 %85, label %.L967, label %.L968
.L968:
	%86 = load i64, ptr @token, align 8
	; load constant 8 into %87
	%87 = add i64 8, 0
	%88 = add i64 %86, %87
	%89 = inttoptr i64 %88 to ptr
	%90 = load i64, ptr %89, align 8
	%91 = getelementptr i64, ptr %ident, i64 0
	%92 = ptrtoint ptr %91 to i64
	%93 = inttoptr i64 %92 to ptr
	store i64 %90, ptr %93, align 8
	%94  = add i64 %90, 0; bloody hack
	store i64 %90, ptr %0, align 8
	%95 = call i64 @getToken()
	store i64 %95, ptr %0, align 8
	%96 = load i64, ptr @token, align 8
	%97 = inttoptr i64 %96 to ptr
	%98 = load i64, ptr %97, align 8
	; load constant 12 into %99
	%99 = add i64 12, 0
	%100 = icmp eq i64 %98, %99
	%101 = zext i1 %100 to i64
	%102 = sub i64 %101, 0
	%103 = icmp eq i64 %102, 0
	br i1 %103, label %.L970, label %.L971
.L971:
	%104 = call i64 @getToken()
	store i64 %104, ptr %0, align 8
	%105 = load i64, ptr %ident, align 8
	%106 = call i64 @createCallExpr(i64 %105)
	%107 = getelementptr i64, ptr %callExpr, i64 0
	%108 = ptrtoint ptr %107 to i64
	%109 = inttoptr i64 %108 to ptr
	store i64 %106, ptr %109, align 8
	%110  = add i64 %106, 0; bloody hack
	store i64 %106, ptr %0, align 8
	%111 = call i64 @parseExpr()
	%112 = getelementptr i64, ptr %argExpr, i64 0
	%113 = ptrtoint ptr %112 to i64
	%114 = inttoptr i64 %113 to ptr
	store i64 %111, ptr %114, align 8
	%115  = add i64 %111, 0; bloody hack
	store i64 %111, ptr %0, align 8
	%116 = load i64, ptr %argExpr, align 8
	%117 = sub i64 %116, 0
	%118 = icmp eq i64 %117, 0
	br i1 %118, label %.L973, label %.L974
.L974:
	%119 = load i64, ptr %argExpr, align 8
	%120 = load i64, ptr %callExpr, align 8
	%121 = call i64 @addArgExpr(i64 %120, i64 %119)
	store i64 %121, ptr %0, align 8
	br label %.L975
.L975:
	%122 = load i64, ptr @token, align 8
	%123 = inttoptr i64 %122 to ptr
	%124 = load i64, ptr %123, align 8
	; load constant 6 into %125
	%125 = add i64 6, 0
	%126 = icmp eq i64 %124, %125
	%127 = zext i1 %126 to i64
	%128 = sub i64 %127, 0
	%129 = icmp eq i64 %128, 0
	br i1 %129, label %.L976, label %.L977
.L977:
	%130 = call i64 @getToken()
	store i64 %130, ptr %0, align 8
	%131 = call i64 @parseExpr()
	%132 = getelementptr i64, ptr %argExpr, i64 0
	%133 = ptrtoint ptr %132 to i64
	%134 = inttoptr i64 %133 to ptr
	store i64 %131, ptr %134, align 8
	%135  = add i64 %131, 0; bloody hack
	store i64 %131, ptr %0, align 8
	%136 = load i64, ptr %argExpr, align 8
	; load constant 0 into %137
	%137 = add i64 0, 0
	%138 = icmp eq i64 %136, %137
	%139 = zext i1 %138 to i64
	%140 = sub i64 %139, 0
	%141 = icmp eq i64 %140, 0
	br i1 %141, label %.L979, label %.L980
.L980:
	%142 = getelementptr i64, ptr @.STR306, i64 0
	%143 = ptrtoint ptr %142 to i64
	%144 = call i64 @error(i64 %143)
	store i64 %144, ptr %0, align 8
	br label %.L978
.L979:
	br label %.L978
.L978:
	%145 = load i64, ptr %argExpr, align 8
	%146 = load i64, ptr %callExpr, align 8
	%147 = call i64 @addArgExpr(i64 %146, i64 %145)
	store i64 %147, ptr %0, align 8
	br label %.L975
.L976:
	br label %.L972
.L973:
	br label %.L972
.L972:
	%148 = load i64, ptr @token, align 8
	%149 = inttoptr i64 %148 to ptr
	%150 = load i64, ptr %149, align 8
	; load constant 11 into %151
	%151 = add i64 11, 0
	%152 = icmp ne i64 %150, %151
	%153 = zext i1 %152 to i64
	%154 = sub i64 %153, 0
	%155 = icmp eq i64 %154, 0
	br i1 %155, label %.L982, label %.L983
.L983:
	%156 = getelementptr i64, ptr @.STR307, i64 0
	%157 = ptrtoint ptr %156 to i64
	%158 = call i64 @expected(i64 %157)
	store i64 %158, ptr %0, align 8
	br label %.L981
.L982:
	br label %.L981
.L981:
	%159 = call i64 @getToken()
	store i64 %159, ptr %0, align 8
	%160 = load i64, ptr %callExpr, align 8
	%161 = getelementptr i64, ptr %expr, i64 0
	%162 = ptrtoint ptr %161 to i64
	%163 = inttoptr i64 %162 to ptr
	store i64 %160, ptr %163, align 8
	%164  = add i64 %160, 0; bloody hack
	store i64 %160, ptr %0, align 8
	br label %.L969
.L970:
	%165 = load i64, ptr %ident, align 8
	%166 = call i64 @createIdentifierExpr(i64 %165)
	%167 = getelementptr i64, ptr %expr, i64 0
	%168 = ptrtoint ptr %167 to i64
	%169 = inttoptr i64 %168 to ptr
	store i64 %166, ptr %169, align 8
	%170  = add i64 %166, 0; bloody hack
	store i64 %166, ptr %0, align 8
	br label %.L969
.L969:
	br label %.L966
.L967:
	%171 = load i64, ptr @token, align 8
	%172 = inttoptr i64 %171 to ptr
	%173 = load i64, ptr %172, align 8
	; load constant 12 into %174
	%174 = add i64 12, 0
	%175 = icmp eq i64 %173, %174
	%176 = zext i1 %175 to i64
	%177 = sub i64 %176, 0
	%178 = icmp eq i64 %177, 0
	br i1 %178, label %.L985, label %.L986
.L986:
	%179 = call i64 @getToken()
	store i64 %179, ptr %0, align 8
	%180 = call i64 @parseExpr()
	%181 = getelementptr i64, ptr %expr, i64 0
	%182 = ptrtoint ptr %181 to i64
	%183 = inttoptr i64 %182 to ptr
	store i64 %180, ptr %183, align 8
	%184  = add i64 %180, 0; bloody hack
	store i64 %180, ptr %0, align 8
	%185 = load i64, ptr %expr, align 8
	; load constant 0 into %186
	%186 = add i64 0, 0
	%187 = icmp eq i64 %185, %186
	%188 = zext i1 %187 to i64
	%189 = sub i64 %188, 0
	%190 = icmp eq i64 %189, 0
	br i1 %190, label %.L988, label %.L989
.L989:
	%191 = getelementptr i64, ptr @.STR308, i64 0
	%192 = ptrtoint ptr %191 to i64
	%193 = call i64 @error(i64 %192)
	store i64 %193, ptr %0, align 8
	br label %.L987
.L988:
	br label %.L987
.L987:
	%194 = load i64, ptr @token, align 8
	%195 = inttoptr i64 %194 to ptr
	%196 = load i64, ptr %195, align 8
	; load constant 11 into %197
	%197 = add i64 11, 0
	%198 = icmp ne i64 %196, %197
	%199 = zext i1 %198 to i64
	%200 = sub i64 %199, 0
	%201 = icmp eq i64 %200, 0
	br i1 %201, label %.L991, label %.L992
.L992:
	%202 = getelementptr i64, ptr @.STR309, i64 0
	%203 = ptrtoint ptr %202 to i64
	%204 = call i64 @expected(i64 %203)
	store i64 %204, ptr %0, align 8
	br label %.L990
.L991:
	br label %.L990
.L990:
	%205 = call i64 @getToken()
	store i64 %205, ptr %0, align 8
	br label %.L984
.L985:
	; load constant 0 into %206
	%206 = add i64 0, 0
	%207 = getelementptr i64, ptr %expr, i64 0
	%208 = ptrtoint ptr %207 to i64
	%209 = inttoptr i64 %208 to ptr
	store i64 %206, ptr %209, align 8
	%210  = add i64 %206, 0; bloody hack
	store i64 %206, ptr %0, align 8
	br label %.L984
.L984:
	br label %.L966
.L966:
	br label %.L963
.L963:
	br label %.L955
.L955:
	%211 = load i64, ptr %expr, align 8
	store i64 %211, ptr %0, align 8
	br label %.L993
.L993:
	%212= load i64, ptr %0, align 8
	ret i64 %212
}

@.STR309 = global [11 x i8] c"expected )\00", align 8
@.STR308 = global [20 x i8] c"expected expression\00", align 8
@.STR307 = global [11 x i8] c"expected )\00", align 8
@.STR306 = global [21 x i8] c"expression exprected\00", align 8
; function testParseExpr
define i64 @testParseExpr() {
.L994:
	%0 = alloca i64, align 8 ; ptr to ret val
	%1 = call i64 @initLexer()
	store i64 %1, ptr %0, align 8
	%2 = call i64 @genInitCode()
	store i64 %2, ptr %0, align 8
	%3 = getelementptr i64, ptr @.STR310, i64 0
	%4 = ptrtoint ptr %3 to i64
	%5 = call i64 @UStrCreate(i64 %4)
	%6 = call i64 @genAddGlobal(i64 %5)
	store i64 %6, ptr %0, align 8
	%7 = getelementptr i64, ptr @.STR311, i64 0
	%8 = ptrtoint ptr %7 to i64
	%9 = call i64 @UStrCreate(i64 %8)
	%10 = call i64 @genAddGlobal(i64 %9)
	store i64 %10, ptr %0, align 8
	%11 = getelementptr i64, ptr @.STR312, i64 0
	%12 = ptrtoint ptr %11 to i64
	%13 = call i64 @UStrCreate(i64 %12)
	%14 = call i64 @genFuncDefBegin(i64 %13)
	store i64 %14, ptr %0, align 8
	%15 = getelementptr i64, ptr @.STR313, i64 0
	%16 = ptrtoint ptr %15 to i64
	%17 = call i64 @UStrCreate(i64 %16)
	%18 = call i64 @genAddLocal(i64 %17)
	store i64 %18, ptr %0, align 8
	%19 = getelementptr i64, ptr @.STR314, i64 0
	%20 = ptrtoint ptr %19 to i64
	%21 = call i64 @UStrCreate(i64 %20)
	%22 = call i64 @genAddLocal(i64 %21)
	store i64 %22, ptr %0, align 8
	%23 = call i64 @getToken()
	store i64 %23, ptr %0, align 8
	%expr = alloca i64, align 8
	%24 = call i64 @parseExpr()
	%25 = getelementptr i64, ptr %expr, i64 0
	%26 = ptrtoint ptr %25 to i64
	%27 = inttoptr i64 %26 to ptr
	store i64 %24, ptr %27, align 8
	%28  = add i64 %24, 0; bloody hack
	store i64 %24, ptr %0, align 8
	%29 = getelementptr i64, ptr @.STR315, i64 0
	%30 = ptrtoint ptr %29 to i64
	%31 = call i64 @print(i64 %30)
	store i64 %31, ptr %0, align 8
	%32 = load i64, ptr %expr, align 8
	%33 = call i64 @printExprTree(i64 %32)
	store i64 %33, ptr %0, align 8
	; load constant 0 into %34
	%34 = add i64 0, 0
	%35 = call i64 @println(i64 %34)
	store i64 %35, ptr %0, align 8
	%36 = load i64, ptr %expr, align 8
	%37 = call i64 @loadExpr(i64 %36)
	%38 = call i64 @genStoreReturnVal(i64 %37)
	store i64 %38, ptr %0, align 8
	%39 = load i64, ptr %expr, align 8
	%40 = call i64 @releaseExpr(i64 %39)
	store i64 %40, ptr %0, align 8
	%41 = call i64 @genFuncDefEnd()
	store i64 %41, ptr %0, align 8
	%42 = call i64 @symtabPrintGlobals()
	store i64 %42, ptr %0, align 8
	br label %.L995
.L995:
	%43= load i64, ptr %0, align 8
	ret i64 %43
}

@.STR315 = global [3 x i8] c"; \00", align 8
@.STR314 = global [2 x i8] c"y\00", align 8
@.STR313 = global [2 x i8] c"x\00", align 8
@.STR312 = global [5 x i8] c"main\00", align 8
@.STR311 = global [2 x i8] c"b\00", align 8
@.STR310 = global [2 x i8] c"a\00", align 8
; function parseTopLevel
define i64 @parseTopLevel() {
.L996:
	%0 = alloca i64, align 8 ; ptr to ret val
	%1 = call i64 @getToken()
	store i64 %1, ptr %0, align 8
	br label %.L997
.L997:
	%.TMP29 = alloca i64, align 8
	%2 = call i64 @parseGlobal()
	%3 = sub i64 %2, 0
	%4 = icmp eq i64 %3, 0
	br i1 %4, label %.L1000, label %.L1002
.L1002:
	%5 = getelementptr i64, ptr %.TMP29, i64 0
	%6 = ptrtoint ptr %5 to i64
	; load constant 1 into %7
	%7 = add i64 1, 0
	%8 = inttoptr i64 %6 to ptr
	store i64 %7, ptr %8, align 8
	%9  = add i64 %7, 0; bloody hack
	br label %.L999
.L1000:
	%10 = call i64 @parseFn()
	%11 = sub i64 %10, 0
	%12 = icmp ne i64 %11, 0
	br i1 %12, label %.L1001, label %.L1003
.L1003:
	%13 = getelementptr i64, ptr %.TMP29, i64 0
	%14 = ptrtoint ptr %13 to i64
	; load constant 0 into %15
	%15 = add i64 0, 0
	%16 = inttoptr i64 %14 to ptr
	store i64 %15, ptr %16, align 8
	%17  = add i64 %15, 0; bloody hack
	br label %.L999
.L1001:
	%18 = getelementptr i64, ptr %.TMP29, i64 0
	%19 = ptrtoint ptr %18 to i64
	; load constant 1 into %20
	%20 = add i64 1, 0
	%21 = inttoptr i64 %19 to ptr
	store i64 %20, ptr %21, align 8
	%22  = add i64 %20, 0; bloody hack
	br label %.L999
.L999:
	%23 = getelementptr i64, ptr %.TMP29, i64 0
	%24 = ptrtoint ptr %23 to i64
	%25 = inttoptr i64 %24 to ptr
	%26 = load i64, ptr %25, align 8
	%27 = sub i64 %26, 0
	%28 = icmp eq i64 %27, 0
	br i1 %28, label %.L998, label %.L1004
.L1004:
	br label %.L997
.L998:
	; load constant 1 into %29
	%29 = add i64 1, 0
	%30 = call i64 @expected(i64 %29)
	store i64 %30, ptr %0, align 8
	; load constant 1 into %31
	%31 = add i64 1, 0
	store i64 %31, ptr %0, align 8
	br label %.L1005
.L1005:
	%32= load i64, ptr %0, align 8
	ret i64 %32
}

; function parseGlobal
define i64 @parseGlobal() {
.L1006:
	%0 = alloca i64, align 8 ; ptr to ret val
	%succ = alloca i64, align 8
	%1 = load i64, ptr @token, align 8
	%2 = inttoptr i64 %1 to ptr
	%3 = load i64, ptr %2, align 8
	; load constant 19 into %4
	%4 = add i64 19, 0
	%5 = icmp ne i64 %3, %4
	%6 = zext i1 %5 to i64
	%7 = sub i64 %6, 0
	%8 = icmp eq i64 %7, 0
	br i1 %8, label %.L1008, label %.L1009
.L1009:
	; load constant 0 into %9
	%9 = add i64 0, 0
	%10 = getelementptr i64, ptr %succ, i64 0
	%11 = ptrtoint ptr %10 to i64
	%12 = inttoptr i64 %11 to ptr
	store i64 %9, ptr %12, align 8
	%13  = add i64 %9, 0; bloody hack
	store i64 %9, ptr %0, align 8
	br label %.L1007
.L1008:
	%14 = call i64 @getToken()
	store i64 %14, ptr %0, align 8
	%done = alloca i64, align 8
	; load constant 0 into %15
	%15 = add i64 0, 0
	%16 = getelementptr i64, ptr %done, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = inttoptr i64 %17 to ptr
	store i64 %15, ptr %18, align 8
	%19  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %0, align 8
	br label %.L1010
.L1010:
	%.TMP30 = alloca i64, align 8
	%20 = load i64, ptr @token, align 8
	%21 = inttoptr i64 %20 to ptr
	%22 = load i64, ptr %21, align 8
	; load constant 3 into %23
	%23 = add i64 3, 0
	%24 = icmp eq i64 %22, %23
	%25 = zext i1 %24 to i64
	%26 = sub i64 %25, 0
	%27 = icmp ne i64 %26, 0
	br i1 %27, label %.L1013, label %.L1015
.L1015:
	%28 = getelementptr i64, ptr %.TMP30, i64 0
	%29 = ptrtoint ptr %28 to i64
	; load constant 0 into %30
	%30 = add i64 0, 0
	%31 = inttoptr i64 %29 to ptr
	store i64 %30, ptr %31, align 8
	%32  = add i64 %30, 0; bloody hack
	; jump to end
	br label %.L1012
.L1013:
	%33 = load i64, ptr %done, align 8
	; load constant 0 into %34
	%34 = add i64 0, 0
	%35 = icmp eq i64 %33, %34
	%36 = zext i1 %35 to i64
	%37 = sub i64 %36, 0
	%38 = icmp ne i64 %37, 0
	br i1 %38, label %.L1014, label %.L1016
.L1016:
	%39 = getelementptr i64, ptr %.TMP30, i64 0
	%40 = ptrtoint ptr %39 to i64
	; load constant 0 into %41
	%41 = add i64 0, 0
	%42 = inttoptr i64 %40 to ptr
	store i64 %41, ptr %42, align 8
	%43  = add i64 %41, 0; bloody hack
	; jump to end
	br label %.L1012
.L1014:
	%44 = getelementptr i64, ptr %.TMP30, i64 0
	%45 = ptrtoint ptr %44 to i64
	; load constant 1 into %46
	%46 = add i64 1, 0
	%47 = inttoptr i64 %45 to ptr
	store i64 %46, ptr %47, align 8
	%48  = add i64 %46, 0; bloody hack
	br label %.L1012
.L1012:
	%49 = getelementptr i64, ptr %.TMP30, i64 0
	%50 = ptrtoint ptr %49 to i64
	%51 = inttoptr i64 %50 to ptr
	%52 = load i64, ptr %51, align 8
	%53 = sub i64 %52, 0
	%54 = icmp eq i64 %53, 0
	br i1 %54, label %.L1011, label %.L1017
.L1017:
	%55 = load i64, ptr @token, align 8
	; load constant 8 into %56
	%56 = add i64 8, 0
	%57 = add i64 %55, %56
	%58 = inttoptr i64 %57 to ptr
	%59 = load i64, ptr %58, align 8
	%60 = call i64 @genAddGlobal(i64 %59)
	store i64 %60, ptr %0, align 8
	%61 = call i64 @getToken()
	store i64 %61, ptr %0, align 8
	%62 = load i64, ptr @token, align 8
	%63 = inttoptr i64 %62 to ptr
	%64 = load i64, ptr %63, align 8
	; load constant 6 into %65
	%65 = add i64 6, 0
	%66 = icmp ne i64 %64, %65
	%67 = zext i1 %66 to i64
	%68 = sub i64 %67, 0
	%69 = icmp eq i64 %68, 0
	br i1 %69, label %.L1019, label %.L1020
.L1020:
	; load constant 1 into %70
	%70 = add i64 1, 0
	%71 = getelementptr i64, ptr %done, i64 0
	%72 = ptrtoint ptr %71 to i64
	%73 = inttoptr i64 %72 to ptr
	store i64 %70, ptr %73, align 8
	%74  = add i64 %70, 0; bloody hack
	store i64 %70, ptr %0, align 8
	br label %.L1018
.L1019:
	%75 = call i64 @getToken()
	store i64 %75, ptr %0, align 8
	br label %.L1018
.L1018:
	br label %.L1010
.L1011:
	; load constant 5 into %76
	%76 = add i64 5, 0
	%77 = call i64 @expected(i64 %76)
	store i64 %77, ptr %0, align 8
	%78 = call i64 @getToken()
	store i64 %78, ptr %0, align 8
	; load constant 1 into %79
	%79 = add i64 1, 0
	%80 = getelementptr i64, ptr %succ, i64 0
	%81 = ptrtoint ptr %80 to i64
	%82 = inttoptr i64 %81 to ptr
	store i64 %79, ptr %82, align 8
	%83  = add i64 %79, 0; bloody hack
	store i64 %79, ptr %0, align 8
	br label %.L1007
.L1007:
	%84 = load i64, ptr %succ, align 8
	store i64 %84, ptr %0, align 8
	br label %.L1021
.L1021:
	%85= load i64, ptr %0, align 8
	ret i64 %85
}

; function parseLocal
define i64 @parseLocal() {
.L1022:
	%0 = alloca i64, align 8 ; ptr to ret val
	%succ = alloca i64, align 8
	%1 = load i64, ptr @token, align 8
	%2 = inttoptr i64 %1 to ptr
	%3 = load i64, ptr %2, align 8
	; load constant 20 into %4
	%4 = add i64 20, 0
	%5 = icmp ne i64 %3, %4
	%6 = zext i1 %5 to i64
	%7 = sub i64 %6, 0
	%8 = icmp eq i64 %7, 0
	br i1 %8, label %.L1024, label %.L1025
.L1025:
	; load constant 0 into %9
	%9 = add i64 0, 0
	%10 = getelementptr i64, ptr %succ, i64 0
	%11 = ptrtoint ptr %10 to i64
	%12 = inttoptr i64 %11 to ptr
	store i64 %9, ptr %12, align 8
	%13  = add i64 %9, 0; bloody hack
	store i64 %9, ptr %0, align 8
	br label %.L1023
.L1024:
	%14 = call i64 @getToken()
	store i64 %14, ptr %0, align 8
	%done = alloca i64, align 8
	; load constant 0 into %15
	%15 = add i64 0, 0
	%16 = getelementptr i64, ptr %done, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = inttoptr i64 %17 to ptr
	store i64 %15, ptr %18, align 8
	%19  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %0, align 8
	br label %.L1026
.L1026:
	%.TMP31 = alloca i64, align 8
	%20 = load i64, ptr @token, align 8
	%21 = inttoptr i64 %20 to ptr
	%22 = load i64, ptr %21, align 8
	; load constant 3 into %23
	%23 = add i64 3, 0
	%24 = icmp eq i64 %22, %23
	%25 = zext i1 %24 to i64
	%26 = sub i64 %25, 0
	%27 = icmp ne i64 %26, 0
	br i1 %27, label %.L1029, label %.L1031
.L1031:
	%28 = getelementptr i64, ptr %.TMP31, i64 0
	%29 = ptrtoint ptr %28 to i64
	; load constant 0 into %30
	%30 = add i64 0, 0
	%31 = inttoptr i64 %29 to ptr
	store i64 %30, ptr %31, align 8
	%32  = add i64 %30, 0; bloody hack
	; jump to end
	br label %.L1028
.L1029:
	%33 = load i64, ptr %done, align 8
	; load constant 0 into %34
	%34 = add i64 0, 0
	%35 = icmp eq i64 %33, %34
	%36 = zext i1 %35 to i64
	%37 = sub i64 %36, 0
	%38 = icmp ne i64 %37, 0
	br i1 %38, label %.L1030, label %.L1032
.L1032:
	%39 = getelementptr i64, ptr %.TMP31, i64 0
	%40 = ptrtoint ptr %39 to i64
	; load constant 0 into %41
	%41 = add i64 0, 0
	%42 = inttoptr i64 %40 to ptr
	store i64 %41, ptr %42, align 8
	%43  = add i64 %41, 0; bloody hack
	; jump to end
	br label %.L1028
.L1030:
	%44 = getelementptr i64, ptr %.TMP31, i64 0
	%45 = ptrtoint ptr %44 to i64
	; load constant 1 into %46
	%46 = add i64 1, 0
	%47 = inttoptr i64 %45 to ptr
	store i64 %46, ptr %47, align 8
	%48  = add i64 %46, 0; bloody hack
	br label %.L1028
.L1028:
	%49 = getelementptr i64, ptr %.TMP31, i64 0
	%50 = ptrtoint ptr %49 to i64
	%51 = inttoptr i64 %50 to ptr
	%52 = load i64, ptr %51, align 8
	%53 = sub i64 %52, 0
	%54 = icmp eq i64 %53, 0
	br i1 %54, label %.L1027, label %.L1033
.L1033:
	%55 = load i64, ptr @token, align 8
	; load constant 8 into %56
	%56 = add i64 8, 0
	%57 = add i64 %55, %56
	%58 = inttoptr i64 %57 to ptr
	%59 = load i64, ptr %58, align 8
	%60 = call i64 @genAddLocal(i64 %59)
	store i64 %60, ptr %0, align 8
	%61 = call i64 @getToken()
	store i64 %61, ptr %0, align 8
	%62 = load i64, ptr @token, align 8
	%63 = inttoptr i64 %62 to ptr
	%64 = load i64, ptr %63, align 8
	; load constant 6 into %65
	%65 = add i64 6, 0
	%66 = icmp ne i64 %64, %65
	%67 = zext i1 %66 to i64
	%68 = sub i64 %67, 0
	%69 = icmp eq i64 %68, 0
	br i1 %69, label %.L1035, label %.L1036
.L1036:
	; load constant 1 into %70
	%70 = add i64 1, 0
	%71 = getelementptr i64, ptr %done, i64 0
	%72 = ptrtoint ptr %71 to i64
	%73 = inttoptr i64 %72 to ptr
	store i64 %70, ptr %73, align 8
	%74  = add i64 %70, 0; bloody hack
	store i64 %70, ptr %0, align 8
	br label %.L1034
.L1035:
	%75 = call i64 @getToken()
	store i64 %75, ptr %0, align 8
	br label %.L1034
.L1034:
	br label %.L1026
.L1027:
	; load constant 5 into %76
	%76 = add i64 5, 0
	%77 = call i64 @expected(i64 %76)
	store i64 %77, ptr %0, align 8
	%78 = call i64 @getToken()
	store i64 %78, ptr %0, align 8
	; load constant 1 into %79
	%79 = add i64 1, 0
	%80 = getelementptr i64, ptr %succ, i64 0
	%81 = ptrtoint ptr %80 to i64
	%82 = inttoptr i64 %81 to ptr
	store i64 %79, ptr %82, align 8
	%83  = add i64 %79, 0; bloody hack
	store i64 %79, ptr %0, align 8
	br label %.L1023
.L1023:
	%84 = load i64, ptr %succ, align 8
	store i64 %84, ptr %0, align 8
	br label %.L1037
.L1037:
	%85= load i64, ptr %0, align 8
	ret i64 %85
}

; function parseFn
define i64 @parseFn() {
.L1038:
	%0 = alloca i64, align 8 ; ptr to ret val
	%succ = alloca i64, align 8
	%1 = load i64, ptr @token, align 8
	%2 = inttoptr i64 %1 to ptr
	%3 = load i64, ptr %2, align 8
	; load constant 23 into %4
	%4 = add i64 23, 0
	%5 = icmp ne i64 %3, %4
	%6 = zext i1 %5 to i64
	%7 = sub i64 %6, 0
	%8 = icmp eq i64 %7, 0
	br i1 %8, label %.L1040, label %.L1041
.L1041:
	; load constant 0 into %9
	%9 = add i64 0, 0
	%10 = getelementptr i64, ptr %succ, i64 0
	%11 = ptrtoint ptr %10 to i64
	%12 = inttoptr i64 %11 to ptr
	store i64 %9, ptr %12, align 8
	%13  = add i64 %9, 0; bloody hack
	store i64 %9, ptr %0, align 8
	br label %.L1039
.L1040:
	%14 = call i64 @getToken()
	store i64 %14, ptr %0, align 8
	; load constant 3 into %15
	%15 = add i64 3, 0
	%16 = call i64 @expected(i64 %15)
	store i64 %16, ptr %0, align 8
	%fnName = alloca i64, align 8
	%17 = load i64, ptr @token, align 8
	; load constant 8 into %18
	%18 = add i64 8, 0
	%19 = add i64 %17, %18
	%20 = inttoptr i64 %19 to ptr
	%21 = load i64, ptr %20, align 8
	%22 = getelementptr i64, ptr %fnName, i64 0
	%23 = ptrtoint ptr %22 to i64
	%24 = inttoptr i64 %23 to ptr
	store i64 %21, ptr %24, align 8
	%25  = add i64 %21, 0; bloody hack
	store i64 %21, ptr %0, align 8
	%26 = call i64 @getToken()
	store i64 %26, ptr %0, align 8
	; load constant 12 into %27
	%27 = add i64 12, 0
	%28 = call i64 @expected(i64 %27)
	store i64 %28, ptr %0, align 8
	%29 = call i64 @getToken()
	store i64 %29, ptr %0, align 8
	%30 = load i64, ptr @token, align 8
	%31 = inttoptr i64 %30 to ptr
	%32 = load i64, ptr %31, align 8
	; load constant 3 into %33
	%33 = add i64 3, 0
	%34 = icmp eq i64 %32, %33
	%35 = zext i1 %34 to i64
	%36 = sub i64 %35, 0
	%37 = icmp eq i64 %36, 0
	br i1 %37, label %.L1043, label %.L1044
.L1044:
	%38 = load i64, ptr @token, align 8
	; load constant 8 into %39
	%39 = add i64 8, 0
	%40 = add i64 %38, %39
	%41 = inttoptr i64 %40 to ptr
	%42 = load i64, ptr %41, align 8
	%43 = call i64 @genFuncDefParam(i64 %42)
	store i64 %43, ptr %0, align 8
	%44 = call i64 @getToken()
	store i64 %44, ptr %0, align 8
	br label %.L1045
.L1045:
	%45 = load i64, ptr @token, align 8
	%46 = inttoptr i64 %45 to ptr
	%47 = load i64, ptr %46, align 8
	; load constant 6 into %48
	%48 = add i64 6, 0
	%49 = icmp eq i64 %47, %48
	%50 = zext i1 %49 to i64
	%51 = sub i64 %50, 0
	%52 = icmp eq i64 %51, 0
	br i1 %52, label %.L1046, label %.L1047
.L1047:
	%53 = call i64 @getToken()
	store i64 %53, ptr %0, align 8
	; load constant 3 into %54
	%54 = add i64 3, 0
	%55 = call i64 @expected(i64 %54)
	store i64 %55, ptr %0, align 8
	%56 = load i64, ptr @token, align 8
	; load constant 8 into %57
	%57 = add i64 8, 0
	%58 = add i64 %56, %57
	%59 = inttoptr i64 %58 to ptr
	%60 = load i64, ptr %59, align 8
	%61 = call i64 @genFuncDefParam(i64 %60)
	store i64 %61, ptr %0, align 8
	%62 = call i64 @getToken()
	store i64 %62, ptr %0, align 8
	br label %.L1045
.L1046:
	br label %.L1042
.L1043:
	br label %.L1042
.L1042:
	%63 = load i64, ptr %fnName, align 8
	%64 = call i64 @genFuncDefBegin(i64 %63)
	store i64 %64, ptr %0, align 8
	; load constant 11 into %65
	%65 = add i64 11, 0
	%66 = call i64 @expected(i64 %65)
	store i64 %66, ptr %0, align 8
	%67 = call i64 @getToken()
	store i64 %67, ptr %0, align 8
	; load constant 13 into %68
	%68 = add i64 13, 0
	%69 = call i64 @expected(i64 %68)
	store i64 %69, ptr %0, align 8
	%70 = call i64 @parseCompoundStmt()
	store i64 %70, ptr %0, align 8
	%71 = call i64 @genFuncDefEnd()
	store i64 %71, ptr %0, align 8
	; load constant 1 into %72
	%72 = add i64 1, 0
	%73 = getelementptr i64, ptr %succ, i64 0
	%74 = ptrtoint ptr %73 to i64
	%75 = inttoptr i64 %74 to ptr
	store i64 %72, ptr %75, align 8
	%76  = add i64 %72, 0; bloody hack
	store i64 %72, ptr %0, align 8
	br label %.L1039
.L1039:
	%77 = load i64, ptr %succ, align 8
	store i64 %77, ptr %0, align 8
	br label %.L1048
.L1048:
	%78= load i64, ptr %0, align 8
	ret i64 %78
}

; function parseCompoundStmt
define i64 @parseCompoundStmt() {
.L1049:
	%0 = alloca i64, align 8 ; ptr to ret val
	%succ = alloca i64, align 8
	%1 = load i64, ptr @token, align 8
	%2 = inttoptr i64 %1 to ptr
	%3 = load i64, ptr %2, align 8
	; load constant 13 into %4
	%4 = add i64 13, 0
	%5 = icmp ne i64 %3, %4
	%6 = zext i1 %5 to i64
	%7 = sub i64 %6, 0
	%8 = icmp eq i64 %7, 0
	br i1 %8, label %.L1051, label %.L1052
.L1052:
	; load constant 0 into %9
	%9 = add i64 0, 0
	%10 = getelementptr i64, ptr %succ, i64 0
	%11 = ptrtoint ptr %10 to i64
	%12 = inttoptr i64 %11 to ptr
	store i64 %9, ptr %12, align 8
	%13  = add i64 %9, 0; bloody hack
	store i64 %9, ptr %0, align 8
	br label %.L1050
.L1051:
	%14 = call i64 @getToken()
	store i64 %14, ptr %0, align 8
	br label %.L1053
.L1053:
	%.TMP32 = alloca i64, align 8
	%.TMP33 = alloca i64, align 8
	%.TMP34 = alloca i64, align 8
	%15 = call i64 @parseExprStmt()
	%16 = sub i64 %15, 0
	%17 = icmp eq i64 %16, 0
	br i1 %17, label %.L1062, label %.L1064
.L1064:
	%18 = getelementptr i64, ptr %.TMP34, i64 0
	%19 = ptrtoint ptr %18 to i64
	; load constant 1 into %20
	%20 = add i64 1, 0
	%21 = inttoptr i64 %19 to ptr
	store i64 %20, ptr %21, align 8
	%22  = add i64 %20, 0; bloody hack
	br label %.L1061
.L1062:
	%23 = call i64 @parseLocal()
	%24 = sub i64 %23, 0
	%25 = icmp ne i64 %24, 0
	br i1 %25, label %.L1063, label %.L1065
.L1065:
	%26 = getelementptr i64, ptr %.TMP34, i64 0
	%27 = ptrtoint ptr %26 to i64
	; load constant 0 into %28
	%28 = add i64 0, 0
	%29 = inttoptr i64 %27 to ptr
	store i64 %28, ptr %29, align 8
	%30  = add i64 %28, 0; bloody hack
	br label %.L1061
.L1063:
	%31 = getelementptr i64, ptr %.TMP34, i64 0
	%32 = ptrtoint ptr %31 to i64
	; load constant 1 into %33
	%33 = add i64 1, 0
	%34 = inttoptr i64 %32 to ptr
	store i64 %33, ptr %34, align 8
	%35  = add i64 %33, 0; bloody hack
	br label %.L1061
.L1061:
	%36 = getelementptr i64, ptr %.TMP34, i64 0
	%37 = ptrtoint ptr %36 to i64
	%38 = inttoptr i64 %37 to ptr
	%39 = load i64, ptr %38, align 8
	%40 = sub i64 %39, 0
	%41 = icmp eq i64 %40, 0
	br i1 %41, label %.L1059, label %.L1066
.L1066:
	%42 = getelementptr i64, ptr %.TMP33, i64 0
	%43 = ptrtoint ptr %42 to i64
	; load constant 1 into %44
	%44 = add i64 1, 0
	%45 = inttoptr i64 %43 to ptr
	store i64 %44, ptr %45, align 8
	%46  = add i64 %44, 0; bloody hack
	br label %.L1058
.L1059:
	%47 = call i64 @parseWhileStmt()
	%48 = sub i64 %47, 0
	%49 = icmp ne i64 %48, 0
	br i1 %49, label %.L1060, label %.L1067
.L1067:
	%50 = getelementptr i64, ptr %.TMP33, i64 0
	%51 = ptrtoint ptr %50 to i64
	; load constant 0 into %52
	%52 = add i64 0, 0
	%53 = inttoptr i64 %51 to ptr
	store i64 %52, ptr %53, align 8
	%54  = add i64 %52, 0; bloody hack
	br label %.L1058
.L1060:
	%55 = getelementptr i64, ptr %.TMP33, i64 0
	%56 = ptrtoint ptr %55 to i64
	; load constant 1 into %57
	%57 = add i64 1, 0
	%58 = inttoptr i64 %56 to ptr
	store i64 %57, ptr %58, align 8
	%59  = add i64 %57, 0; bloody hack
	br label %.L1058
.L1058:
	%60 = getelementptr i64, ptr %.TMP33, i64 0
	%61 = ptrtoint ptr %60 to i64
	%62 = inttoptr i64 %61 to ptr
	%63 = load i64, ptr %62, align 8
	%64 = sub i64 %63, 0
	%65 = icmp eq i64 %64, 0
	br i1 %65, label %.L1056, label %.L1068
.L1068:
	%66 = getelementptr i64, ptr %.TMP32, i64 0
	%67 = ptrtoint ptr %66 to i64
	; load constant 1 into %68
	%68 = add i64 1, 0
	%69 = inttoptr i64 %67 to ptr
	store i64 %68, ptr %69, align 8
	%70  = add i64 %68, 0; bloody hack
	br label %.L1055
.L1056:
	%71 = call i64 @parseIfStmt()
	%72 = sub i64 %71, 0
	%73 = icmp ne i64 %72, 0
	br i1 %73, label %.L1057, label %.L1069
.L1069:
	%74 = getelementptr i64, ptr %.TMP32, i64 0
	%75 = ptrtoint ptr %74 to i64
	; load constant 0 into %76
	%76 = add i64 0, 0
	%77 = inttoptr i64 %75 to ptr
	store i64 %76, ptr %77, align 8
	%78  = add i64 %76, 0; bloody hack
	br label %.L1055
.L1057:
	%79 = getelementptr i64, ptr %.TMP32, i64 0
	%80 = ptrtoint ptr %79 to i64
	; load constant 1 into %81
	%81 = add i64 1, 0
	%82 = inttoptr i64 %80 to ptr
	store i64 %81, ptr %82, align 8
	%83  = add i64 %81, 0; bloody hack
	br label %.L1055
.L1055:
	%84 = getelementptr i64, ptr %.TMP32, i64 0
	%85 = ptrtoint ptr %84 to i64
	%86 = inttoptr i64 %85 to ptr
	%87 = load i64, ptr %86, align 8
	%88 = sub i64 %87, 0
	%89 = icmp eq i64 %88, 0
	br i1 %89, label %.L1054, label %.L1070
.L1070:
	br label %.L1053
.L1054:
	; load constant 14 into %90
	%90 = add i64 14, 0
	%91 = call i64 @expected(i64 %90)
	store i64 %91, ptr %0, align 8
	%92 = call i64 @getToken()
	store i64 %92, ptr %0, align 8
	; load constant 1 into %93
	%93 = add i64 1, 0
	%94 = getelementptr i64, ptr %succ, i64 0
	%95 = ptrtoint ptr %94 to i64
	%96 = inttoptr i64 %95 to ptr
	store i64 %93, ptr %96, align 8
	%97  = add i64 %93, 0; bloody hack
	store i64 %93, ptr %0, align 8
	br label %.L1050
.L1050:
	%98 = load i64, ptr %succ, align 8
	store i64 %98, ptr %0, align 8
	br label %.L1071
.L1071:
	%99= load i64, ptr %0, align 8
	ret i64 %99
}

; function parseExprStmt
define i64 @parseExprStmt() {
.L1072:
	%0 = alloca i64, align 8 ; ptr to ret val
	%succ = alloca i64, align 8
	%expr = alloca i64, align 8
	%1 = call i64 @parseExpr()
	%2 = getelementptr i64, ptr %expr, i64 0
	%3 = ptrtoint ptr %2 to i64
	%4 = inttoptr i64 %3 to ptr
	store i64 %1, ptr %4, align 8
	%5  = add i64 %1, 0; bloody hack
	store i64 %1, ptr %0, align 8
	%6 = load i64, ptr %expr, align 8
	; load constant 0 into %7
	%7 = add i64 0, 0
	%8 = icmp eq i64 %6, %7
	%9 = zext i1 %8 to i64
	%10 = sub i64 %9, 0
	%11 = icmp eq i64 %10, 0
	br i1 %11, label %.L1074, label %.L1075
.L1075:
	; load constant 0 into %12
	%12 = add i64 0, 0
	%13 = getelementptr i64, ptr %succ, i64 0
	%14 = ptrtoint ptr %13 to i64
	%15 = inttoptr i64 %14 to ptr
	store i64 %12, ptr %15, align 8
	%16  = add i64 %12, 0; bloody hack
	store i64 %12, ptr %0, align 8
	br label %.L1073
.L1074:
	; load constant 5 into %17
	%17 = add i64 5, 0
	%18 = call i64 @expected(i64 %17)
	store i64 %18, ptr %0, align 8
	%19 = call i64 @getToken()
	store i64 %19, ptr %0, align 8
	%retVal = alloca i64, align 8
	%20 = load i64, ptr %expr, align 8
	%21 = call i64 @loadExpr(i64 %20)
	%22 = getelementptr i64, ptr %retVal, i64 0
	%23 = ptrtoint ptr %22 to i64
	%24 = inttoptr i64 %23 to ptr
	store i64 %21, ptr %24, align 8
	%25  = add i64 %21, 0; bloody hack
	store i64 %21, ptr %0, align 8
	%26 = load i64, ptr %retVal, align 8
	%27 = call i64 @genStoreReturnVal(i64 %26)
	store i64 %27, ptr %0, align 8
	%28 = load i64, ptr %expr, align 8
	%29 = call i64 @releaseExpr(i64 %28)
	store i64 %29, ptr %0, align 8
	; load constant 1 into %30
	%30 = add i64 1, 0
	%31 = getelementptr i64, ptr %succ, i64 0
	%32 = ptrtoint ptr %31 to i64
	%33 = inttoptr i64 %32 to ptr
	store i64 %30, ptr %33, align 8
	%34  = add i64 %30, 0; bloody hack
	store i64 %30, ptr %0, align 8
	br label %.L1073
.L1073:
	%35 = load i64, ptr %succ, align 8
	store i64 %35, ptr %0, align 8
	br label %.L1076
.L1076:
	%36= load i64, ptr %0, align 8
	ret i64 %36
}

; function parseWhileStmt
define i64 @parseWhileStmt() {
.L1077:
	%0 = alloca i64, align 8 ; ptr to ret val
	%succ = alloca i64, align 8
	%1 = load i64, ptr @token, align 8
	%2 = inttoptr i64 %1 to ptr
	%3 = load i64, ptr %2, align 8
	; load constant 18 into %4
	%4 = add i64 18, 0
	%5 = icmp ne i64 %3, %4
	%6 = zext i1 %5 to i64
	%7 = sub i64 %6, 0
	%8 = icmp eq i64 %7, 0
	br i1 %8, label %.L1079, label %.L1080
.L1080:
	; load constant 0 into %9
	%9 = add i64 0, 0
	%10 = getelementptr i64, ptr %succ, i64 0
	%11 = ptrtoint ptr %10 to i64
	%12 = inttoptr i64 %11 to ptr
	store i64 %9, ptr %12, align 8
	%13  = add i64 %9, 0; bloody hack
	store i64 %9, ptr %0, align 8
	br label %.L1078
.L1079:
	%14 = call i64 @getToken()
	store i64 %14, ptr %0, align 8
	%condLabel = alloca i64, align 8
	%15 = call i64 @genGetLabel()
	%16 = getelementptr i64, ptr %condLabel, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = inttoptr i64 %17 to ptr
	store i64 %15, ptr %18, align 8
	%19  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %0, align 8
	%doneLabel = alloca i64, align 8
	%20 = call i64 @genGetLabel()
	%21 = getelementptr i64, ptr %doneLabel, i64 0
	%22 = ptrtoint ptr %21 to i64
	%23 = inttoptr i64 %22 to ptr
	store i64 %20, ptr %23, align 8
	%24  = add i64 %20, 0; bloody hack
	store i64 %20, ptr %0, align 8
	; load constant 12 into %25
	%25 = add i64 12, 0
	%26 = call i64 @expected(i64 %25)
	store i64 %26, ptr %0, align 8
	%27 = call i64 @getToken()
	store i64 %27, ptr %0, align 8
	%expr = alloca i64, align 8
	%28 = call i64 @parseExpr()
	%29 = getelementptr i64, ptr %expr, i64 0
	%30 = ptrtoint ptr %29 to i64
	%31 = inttoptr i64 %30 to ptr
	store i64 %28, ptr %31, align 8
	%32  = add i64 %28, 0; bloody hack
	store i64 %28, ptr %0, align 8
	%33 = load i64, ptr %expr, align 8
	; load constant 0 into %34
	%34 = add i64 0, 0
	%35 = icmp eq i64 %33, %34
	%36 = zext i1 %35 to i64
	%37 = sub i64 %36, 0
	%38 = icmp eq i64 %37, 0
	br i1 %38, label %.L1082, label %.L1083
.L1083:
	%39 = getelementptr i64, ptr @.STR316, i64 0
	%40 = ptrtoint ptr %39 to i64
	%41 = call i64 @error(i64 %40)
	store i64 %41, ptr %0, align 8
	br label %.L1081
.L1082:
	br label %.L1081
.L1081:
	; load constant 11 into %42
	%42 = add i64 11, 0
	%43 = call i64 @expected(i64 %42)
	store i64 %43, ptr %0, align 8
	%44 = call i64 @getToken()
	store i64 %44, ptr %0, align 8
	%45 = load i64, ptr %condLabel, align 8
	%46 = call i64 @genDefLabel(i64 %45)
	store i64 %46, ptr %0, align 8
	%condVal = alloca i64, align 8
	%47 = load i64, ptr %expr, align 8
	%48 = call i64 @loadExpr(i64 %47)
	%49 = getelementptr i64, ptr %condVal, i64 0
	%50 = ptrtoint ptr %49 to i64
	%51 = inttoptr i64 %50 to ptr
	store i64 %48, ptr %51, align 8
	%52  = add i64 %48, 0; bloody hack
	store i64 %48, ptr %0, align 8
	%53 = load i64, ptr %doneLabel, align 8
	%54 = load i64, ptr %condVal, align 8
	%55 = call i64 @genJumpIfFalse(i64 %54, i64 %53)
	store i64 %55, ptr %0, align 8
	%56 = load i64, ptr %expr, align 8
	%57 = call i64 @releaseExpr(i64 %56)
	store i64 %57, ptr %0, align 8
	%58 = call i64 @parseCompoundStmt()
	; load constant 0 into %59
	%59 = add i64 0, 0
	%60 = icmp eq i64 %58, %59
	%61 = zext i1 %60 to i64
	%62 = sub i64 %61, 0
	%63 = icmp eq i64 %62, 0
	br i1 %63, label %.L1085, label %.L1086
.L1086:
	%64 = getelementptr i64, ptr @.STR317, i64 0
	%65 = ptrtoint ptr %64 to i64
	%66 = call i64 @error(i64 %65)
	store i64 %66, ptr %0, align 8
	br label %.L1084
.L1085:
	br label %.L1084
.L1084:
	%67 = load i64, ptr %condLabel, align 8
	%68 = call i64 @genJump(i64 %67)
	store i64 %68, ptr %0, align 8
	%69 = load i64, ptr %doneLabel, align 8
	%70 = call i64 @genDefLabel(i64 %69)
	store i64 %70, ptr %0, align 8
	; load constant 1 into %71
	%71 = add i64 1, 0
	%72 = getelementptr i64, ptr %succ, i64 0
	%73 = ptrtoint ptr %72 to i64
	%74 = inttoptr i64 %73 to ptr
	store i64 %71, ptr %74, align 8
	%75  = add i64 %71, 0; bloody hack
	store i64 %71, ptr %0, align 8
	br label %.L1078
.L1078:
	%76 = load i64, ptr %succ, align 8
	store i64 %76, ptr %0, align 8
	br label %.L1087
.L1087:
	%77= load i64, ptr %0, align 8
	ret i64 %77
}

@.STR317 = global [34 x i8] c"compound for then branch expected\00", align 8
@.STR316 = global [20 x i8] c"expression expected\00", align 8
; function parseIfStmt
define i64 @parseIfStmt() {
.L1088:
	%0 = alloca i64, align 8 ; ptr to ret val
	%succ = alloca i64, align 8
	%1 = load i64, ptr @token, align 8
	%2 = inttoptr i64 %1 to ptr
	%3 = load i64, ptr %2, align 8
	; load constant 17 into %4
	%4 = add i64 17, 0
	%5 = icmp ne i64 %3, %4
	%6 = zext i1 %5 to i64
	%7 = sub i64 %6, 0
	%8 = icmp eq i64 %7, 0
	br i1 %8, label %.L1090, label %.L1091
.L1091:
	; load constant 0 into %9
	%9 = add i64 0, 0
	%10 = getelementptr i64, ptr %succ, i64 0
	%11 = ptrtoint ptr %10 to i64
	%12 = inttoptr i64 %11 to ptr
	store i64 %9, ptr %12, align 8
	%13  = add i64 %9, 0; bloody hack
	store i64 %9, ptr %0, align 8
	br label %.L1089
.L1090:
	%14 = call i64 @getToken()
	store i64 %14, ptr %0, align 8
	%doneLabel = alloca i64, align 8
	%15 = call i64 @genGetLabel()
	%16 = getelementptr i64, ptr %doneLabel, i64 0
	%17 = ptrtoint ptr %16 to i64
	%18 = inttoptr i64 %17 to ptr
	store i64 %15, ptr %18, align 8
	%19  = add i64 %15, 0; bloody hack
	store i64 %15, ptr %0, align 8
	%elseLabel = alloca i64, align 8
	%20 = call i64 @genGetLabel()
	%21 = getelementptr i64, ptr %elseLabel, i64 0
	%22 = ptrtoint ptr %21 to i64
	%23 = inttoptr i64 %22 to ptr
	store i64 %20, ptr %23, align 8
	%24  = add i64 %20, 0; bloody hack
	store i64 %20, ptr %0, align 8
	; load constant 12 into %25
	%25 = add i64 12, 0
	%26 = call i64 @expected(i64 %25)
	store i64 %26, ptr %0, align 8
	%27 = call i64 @getToken()
	store i64 %27, ptr %0, align 8
	%expr = alloca i64, align 8
	%28 = call i64 @parseExpr()
	%29 = getelementptr i64, ptr %expr, i64 0
	%30 = ptrtoint ptr %29 to i64
	%31 = inttoptr i64 %30 to ptr
	store i64 %28, ptr %31, align 8
	%32  = add i64 %28, 0; bloody hack
	store i64 %28, ptr %0, align 8
	%33 = load i64, ptr %expr, align 8
	; load constant 0 into %34
	%34 = add i64 0, 0
	%35 = icmp eq i64 %33, %34
	%36 = zext i1 %35 to i64
	%37 = sub i64 %36, 0
	%38 = icmp eq i64 %37, 0
	br i1 %38, label %.L1093, label %.L1094
.L1094:
	%39 = getelementptr i64, ptr @.STR318, i64 0
	%40 = ptrtoint ptr %39 to i64
	%41 = call i64 @error(i64 %40)
	store i64 %41, ptr %0, align 8
	br label %.L1092
.L1093:
	br label %.L1092
.L1092:
	; load constant 11 into %42
	%42 = add i64 11, 0
	%43 = call i64 @expected(i64 %42)
	store i64 %43, ptr %0, align 8
	%44 = call i64 @getToken()
	store i64 %44, ptr %0, align 8
	%condVal = alloca i64, align 8
	%45 = load i64, ptr %expr, align 8
	%46 = call i64 @loadExpr(i64 %45)
	%47 = getelementptr i64, ptr %condVal, i64 0
	%48 = ptrtoint ptr %47 to i64
	%49 = inttoptr i64 %48 to ptr
	store i64 %46, ptr %49, align 8
	%50  = add i64 %46, 0; bloody hack
	store i64 %46, ptr %0, align 8
	%51 = load i64, ptr %elseLabel, align 8
	%52 = load i64, ptr %condVal, align 8
	%53 = call i64 @genJumpIfFalse(i64 %52, i64 %51)
	store i64 %53, ptr %0, align 8
	%54 = load i64, ptr %expr, align 8
	%55 = call i64 @releaseExpr(i64 %54)
	store i64 %55, ptr %0, align 8
	%56 = call i64 @parseCompoundStmt()
	; load constant 0 into %57
	%57 = add i64 0, 0
	%58 = icmp eq i64 %56, %57
	%59 = zext i1 %58 to i64
	%60 = sub i64 %59, 0
	%61 = icmp eq i64 %60, 0
	br i1 %61, label %.L1096, label %.L1097
.L1097:
	%62 = getelementptr i64, ptr @.STR319, i64 0
	%63 = ptrtoint ptr %62 to i64
	%64 = call i64 @error(i64 %63)
	store i64 %64, ptr %0, align 8
	br label %.L1095
.L1096:
	br label %.L1095
.L1095:
	%65 = load i64, ptr %doneLabel, align 8
	%66 = call i64 @genJump(i64 %65)
	store i64 %66, ptr %0, align 8
	%67 = load i64, ptr %elseLabel, align 8
	%68 = call i64 @genDefLabel(i64 %67)
	store i64 %68, ptr %0, align 8
	%69 = load i64, ptr @token, align 8
	%70 = inttoptr i64 %69 to ptr
	%71 = load i64, ptr %70, align 8
	; load constant 21 into %72
	%72 = add i64 21, 0
	%73 = icmp eq i64 %71, %72
	%74 = zext i1 %73 to i64
	%75 = sub i64 %74, 0
	%76 = icmp eq i64 %75, 0
	br i1 %76, label %.L1099, label %.L1100
.L1100:
	%77 = call i64 @getToken()
	store i64 %77, ptr %0, align 8
	%78 = load i64, ptr @token, align 8
	%79 = inttoptr i64 %78 to ptr
	%80 = load i64, ptr %79, align 8
	; load constant 17 into %81
	%81 = add i64 17, 0
	%82 = icmp eq i64 %80, %81
	%83 = zext i1 %82 to i64
	%84 = sub i64 %83, 0
	%85 = icmp eq i64 %84, 0
	br i1 %85, label %.L1102, label %.L1103
.L1103:
	%86 = call i64 @parseIfStmt()
	store i64 %86, ptr %0, align 8
	br label %.L1101
.L1102:
	%87 = call i64 @parseCompoundStmt()
	; load constant 0 into %88
	%88 = add i64 0, 0
	%89 = icmp eq i64 %87, %88
	%90 = zext i1 %89 to i64
	%91 = sub i64 %90, 0
	%92 = icmp eq i64 %91, 0
	br i1 %92, label %.L1105, label %.L1106
.L1106:
	%93 = getelementptr i64, ptr @.STR320, i64 0
	%94 = ptrtoint ptr %93 to i64
	%95 = call i64 @error(i64 %94)
	store i64 %95, ptr %0, align 8
	br label %.L1104
.L1105:
	br label %.L1104
.L1104:
	br label %.L1101
.L1101:
	br label %.L1098
.L1099:
	br label %.L1098
.L1098:
	%96 = load i64, ptr %doneLabel, align 8
	%97 = call i64 @genDefLabel(i64 %96)
	store i64 %97, ptr %0, align 8
	; load constant 1 into %98
	%98 = add i64 1, 0
	%99 = getelementptr i64, ptr %succ, i64 0
	%100 = ptrtoint ptr %99 to i64
	%101 = inttoptr i64 %100 to ptr
	store i64 %98, ptr %101, align 8
	%102  = add i64 %98, 0; bloody hack
	store i64 %98, ptr %0, align 8
	br label %.L1089
.L1089:
	%103 = load i64, ptr %succ, align 8
	store i64 %103, ptr %0, align 8
	br label %.L1107
.L1107:
	%104= load i64, ptr %0, align 8
	ret i64 %104
}

@.STR320 = global [34 x i8] c"compound for else branch expected\00", align 8
@.STR319 = global [34 x i8] c"compound for then branch expected\00", align 8
@.STR318 = global [20 x i8] c"expression expected\00", align 8
; function testCompiler
define i64 @testCompiler() {
.L1108:
	%0 = alloca i64, align 8 ; ptr to ret val
	%1 = call i64 @initLexer()
	store i64 %1, ptr %0, align 8
	%2 = call i64 @genInitCode()
	store i64 %2, ptr %0, align 8
	%3 = call i64 @parseTopLevel()
	store i64 %3, ptr %0, align 8
	%4 = call i64 @symtabPrintGlobals()
	store i64 %4, ptr %0, align 8
	br label %.L1109
.L1109:
	%5= load i64, ptr %0, align 8
	ret i64 %5
}

; function main
define i64 @main() {
.L1110:
	%0 = alloca i64, align 8 ; ptr to ret val
	%1 = call i64 @testCompiler()
	store i64 %1, ptr %0, align 8
	br label %.L1111
.L1111:
	%2= load i64, ptr %0, align 8
	ret i64 %2
}

@genTmpCount = global i64 0
@genFnArgStack = global i64 0
@genFnParamListLast = global i64 0
@genFnParamList = global i64 0
@genStringCount = global i64 0
@genStringList = global i64 0
@genLabelCount = global i64 0
@genFunctionBuildingInfo = global i64 0
@genLastUsedReg = global i64 0
@genUsedReg = global i64 0
@symtabLocalVar = global i64 0
@symtabGlobalVar = global i64 0
@token = global i64 0
@kw_fn = global i64 0
@kw_do = global i64 0
@kw_else = global i64 0
@kw_local = global i64 0
@kw_global = global i64 0
@kw_while = global i64 0
@kw_if = global i64 0
@lexerInternalValCapacity = global i64 0
@lexerInternalVal = global i64 0
@lexerLengthVal = global i64 0
@lexerUpdateVal = global i64 0
@lexerCurrentCol = global i64 0
@lexerCurrentRow = global i64 0
@lexerCh = global i64 0
@ustrList = global i64 0
