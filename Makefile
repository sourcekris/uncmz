build:
	go build -o uncmz uncmz.go

run:
	go run uncmz.go

clean:
	go clean ..
	rm bin/uncmz-*
	rm release/uncmz-*

compile:
	echo "Compiling for every OS and Platform"
	GOOS=linux GOARCH=amd64 go build -o bin/uncmz-linux-amd64 uncmz.go
	GOOS=linux GOARCH=386 go build -o bin/uncmz-linux-i386 uncmz.go
	GOOS=linux GOARCH=arm go build -o bin/uncmz-linux-arm uncmz.go
	GOOS=linux GOARCH=arm64 go build -o bin/uncmz-linux-arm64 uncmz.go
	GOOS=freebsd GOARCH=386 go build -o bin/uncmz-freebsd-i386 uncmz.go
	GOOS=freebsd GOARCH=amd64 go build -o bin/uncmz-freebsd-amd64 uncmz.go
	GOOS=darwin GOARCH=amd64 go build -o bin/uncmz-mac-amd64 uncmz.go
	GOOS=darwin GOARCH=arm64 go build -o bin/uncmz-mac-arm64 uncmz.go
	GOOS=windows GOARCH=amd64 go build -o bin/uncmz-windows-amd64.exe uncmz.go

package:
	echo "Packaging releases into releases/*.zip"
	cd release && cp ../bin/uncmz-linux-amd64 uncmz &&  zip uncmz-linux-amd64.zip uncmz && rm uncmz
	cd release && cp ../bin/uncmz-linux-i386 uncmz &&  zip uncmz-linux-i386.zip uncmz && rm uncmz
	cd release && cp ../bin/uncmz-linux-arm uncmz &&  zip uncmz-linux-arm.zip uncmz && rm uncmz
	cd release && cp ../bin/uncmz-linux-arm64 uncmz &&  zip uncmz-linux-arm64.zip uncmz && rm uncmz
	cd release && cp ../bin/uncmz-freebsd-amd64 uncmz &&  zip uncmz-freebsd-amd64.zip uncmz && rm uncmz
	cd release && cp ../bin/uncmz-freebsd-i386 uncmz &&  zip uncmz-freebsd-i386.zip uncmz && rm uncmz
	cd release && cp ../bin/uncmz-mac-amd64 uncmz &&  zip uncmz-mac-amd64.zip uncmz && rm uncmz
	cd release && cp ../bin/uncmz-mac-arm64 uncmz &&  zip uncmz-mac-arm64.zip uncmz && rm uncmz
	cd release && cp ../bin/uncmz-windows-amd64.exe uncmz.exe &&  zip uncmz-windows-amd64.zip uncmz.exe && rm uncmz.exe

release: compile package
	
all: build