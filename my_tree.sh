#!/bin/bash
git branch -D blue_branch blue_sub_branch || true
git reset --hard 08e70d3
git checkout -b blue_branch

git checkout -b blue_branch
git config user.name "Blue User"
echo "// Blue changed r1" >> комит9/B.java
git add комит9/B.java && git commit -m "r1"


git checkout main
git config user.name "Red User"
echo "// Red r2" >> комит9/G.java
git add комит9/G.java && git commit -m "r2"

echo "// Red r3" >> комит9/H.java
git add комит9/H.java && git commit -m "r3"

echo "// Red conflict line" >> комит9/K.java
git add комит9/K.java && git commit -m "r4"


git checkout blue_branch
git config user.name "Blue User"
echo "// Blue r5" >> комит9/B.java
git add комит9/B.java && git commit -m "r5"


git checkout -b blue_sub_branch
echo "// Blue r6" >> комит9/B.java
git add комит9/B.java && git commit -m "r6"


git checkout blue_branch
echo "// Blue r7" >> комит9/B.java
git add комит9/B.java && git commit -m "r7"


git checkout blue_sub_branch
echo "// Blue conflict line" >> комит9/K.java
git add комит9/K.java && git commit -m "r8"


git checkout main
git config user.name "Red User"

git merge blue_sub_branch -m "r9: Merge blue_sub_branch" || true

git checkout --ours комит9/K.java
echo "// Blue conflict line" >> комит9/K.java
git add комит9/K.java && git commit -m "r9: Resolved conflict in K.java"


git checkout blue_branch
git config user.name "Blue User"
echo "// Blue r10" >> комит9/B.java
git add комит9/B.java && git commit -m "r10"

echo "// Blue r11" >> комит9/B.java
git add комит9/B.java && git commit -m "r11"

git checkout main
git config user.name "Red User"

git merge blue_branch -m "r12: Merge blue_branch" || true

git checkout --ours комит9/B.java
echo "// Blue r7" >> комит9/B.java
echo "// Blue r10" >> комит9/B.java
echo "// Blue r11" >> комит9/B.java
git add комит9/B.java && git commit -m "r12: Resolved conflict in B.java"

echo "// Red r13" >> комит9/G.java
git add комит9/G.java && git commit -m "r13"

echo "// Red r14" >> комит9/H.java
git add комит9/H.java && git commit -m "r14"

# git log --graph --oneline main blue_branch blue_sub_branch
# git log --graph --oneline --all
