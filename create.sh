#!/bin/bash
# ---------- CREATE.SH -------------
# ---------- CREATE.SH ------------

node=0
depth=$1
breadth=$2
dir=$3
input=$4

bfs() {
	#mkdir -p ~/$dir-breadth
	#cd ~/$dir-breadth
	open=("$dir-breadth")
	closed=()

	for ((i=0; i<depth; i++)); do
		temp=()
		for x in ${open[@]}; do
			temp_open=()
			for ((j=0; j<breadth; j++)); do
				mkdir -p $x/$j
				temp=(${temp[@]} $x/$j)
			done
			temp_open=(${temp_open[@]} ${temp[@]})
		done
		closed=($closed[@]} ${temp[@]})
		open=${temp_open[@]}
	done

}

dfs_test_dont_use() {
	open=("$dir-depth")
	closed=()

	for ((i=0; i<breadth; i++)); do
		temp=()
		for x in ${open[@]}; do
			temp_open=()
			for ((j=0; j<depth; j++)); do
				echo mkdir -p $x/$j
				temp=(${temp[@]} $x/$j)
			done
			temp_open=(${temp_open[@]} ${temp[@]})
		done
		closed=($closed[@]} ${temp[@]})
		open=${temp_open[@]}
	done
}

dfs() {

	local level=$1
	local child=$2
	local i=0

	if (( $level <= $depth )); then
                if (( $level != 0 )); then 
                        echo mkdir -p $child
                        cd $child
                fi
                let node++
                let level++

                while [ $i -lt $breadth ]
                do
                        dfs $level $i
                        let i++
                done
                cd ..
        fi
}

if (( $input == "depth" )); then
	mkdir -p ~/$3-depth
	cd ~/$3-depth
	dfs 0 0
	#mkdir -p ~/$3-depth
	#cd ~/$3-depth
else
	#mkdir -p ~/$3-breadth
	#cd ~/$3
	bfs #$depth $breadth $dir
	#mkdir -p ~/$3-breadth

fi


