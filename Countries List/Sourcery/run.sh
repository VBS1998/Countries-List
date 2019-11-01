#!/bin/bash

export GENERATED_FOLDER="Generated"
#export GENERATED_DIR="${GENERATED_FOLDER}"
export SOURCERY_DIR="../Pods/Sourcery/bin"
export SOURCES_DIR="Sources"
export TEMPLATES_DIR="."

echo "Input the files name..."
read FILES_NAME
 
PROJECT_PATH='../Countries List'
export GENERATED_DIR="$PROJECT_PATH/${FILES_NAME}Scene"

# Create the folders for generated files
rm -rf "$GENERATED_DIR"
mkdir "${GENERATED_DIR}"

# Run Sourcery
${SOURCERY_DIR}/sourcery --sources ${SOURCES_DIR} --templates ${TEMPLATES_DIR} --args className=${FILES_NAME} --output "$GENERATED_DIR"

for file in "$GENERATED_DIR"/*
do
    # Considering the generated files are of type: .../gen-Type_of_File-simple.generated.swift
    newFileName=$(echo ${file#*gen} | cut -d "-" -f 2)
    mv "${file}" "$GENERATED_DIR/${FILES_NAME}${newFileName}.swift"
done

# Remove files complex ou simple (depending on which was chosen)
rm -rf "$GENERATED_DIR"/gen*
echo "Generated files should be at $GENERATED_DIR"
