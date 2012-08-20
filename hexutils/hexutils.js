var fs = require("fs");

var buffer_to_hex = function(data) {
    var output = "";

    for(var i=0; i<data.length; i++) {
        var c = data[i].toString(16);

        while(c.length < 2) {
            c = "0" + c;
        }

        output += c;
    }

    return output;
};

var buffer_from_hex = function(data) {
    var buf = new Buffer(data.length / 2);

    for(var i=0; i<data.length; i++) {
        var c = "" + data[i*2] + data[(i*2)+1];
        c = parseInt(c, 16);
        buf[i] = c;
    }

    return buf;
};

function help() {
    console.log("Usage: hexutils [OPTION] [INFILE] [OUTFILE]");
    console.log("Convert hex string to characters or vice versa");
    console.log();
    console.log("  -h, --hex   Convert characters to hex string");
    console.log("  -c, --char  Convert hex string to characters");
    console.log();
    console.log("With no INFILE and OUTFILE, or when INFILE is -, read standard input.");
    console.log("With no OUTFILE, or when OUTFILE is -, write to standard output.");
    console.log();
    console.log("Report bugs to <steve@offend.me.uk>.");
}

if(process.argv.length < 3) {
	help();
    process.exit();
}

var mode = null;
if(process.argv[2] == "-h" || process.argv[2] == "--hex") {
    mode = "hex";
} else if(process.argv[2] == "-c" || process.argv[2] == "--char") {
    mode = "char";
} else {
    help();
    process.exit();
}

var instream, outstream = null;
if(process.argv.length < 4 || process.argv[3] == "-") {
    instream = process.stdin;
    if(mode == "char") {
        process.stdin.setEncoding("utf8");
    }
    process.stdin.resume();
} else {
    instream = fs.createReadStream(process.argv[3], {
        encoding: (mode == "char" ? "utf8" : null)
    });
}

if(process.argv.length < 5 || process.argv[4] == "-") {
    outstream = process.stdout;
    process.stdout.setEncoding("utf8");
} else {
    outstream = fs.createWriteStream(process.argv[4]);
}

function convert(data) {
    return (mode == "hex" ? buffer_to_hex(data) : buffer_from_hex(data));
}

instream.on("error", function(err) {
    console.error("Error reading input");
    process.exit();
});

outstream.on("error", function(err) {
    console.log(err);
    console.error("Error writing output");
    process.exit();
});

instream.on("data", function(data) {
    try {
        data = convert(data);
    } catch(err) {
        console.error("Failed to encode");
        process.exit();
    }

    outstream.write(data);
});

instream.on("end", function(data) {
    outstream.write("\n");
});
