var names: Set<String> = ["yagom", "chulsoo", "younghee"]
var names2: Set<String> = ["yagom", "chulsoo", "younghee", "hoon"]

print(names.count)          // 3
names.insert("jenny")
print(names.count)          // 4

print(names.remove("chulsoo"))  // chulsoo
print(names.remove("john"))     // nil

let inter: Set<String> = names.intersection(names2)
print(inter)