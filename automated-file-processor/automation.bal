import ballerina/io;
import ballerina/lang.regexp;
import ballerina/log;

public function main() returns error? {
    do {
        io:println("Starting file processing...");

        string filePath = "sample.txt";

        string fileContent = check io:fileReadString(filePath);
        string[] words = regexp:split(re `\s+`, fileContent);

        int wordCount = words.length();

        io:println("File Processed Successfully. Word count: ", wordCount);

    } on fail error e {
        log:printError("Error: ", 'error = e);
        return e;
    }
}
