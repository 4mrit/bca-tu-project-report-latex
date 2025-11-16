#!/bin/bash
# Simple script to convert Mermaid diagrams to images using online service
# This is a workaround when mermaid-cli is not available

echo "Converting Mermaid diagrams to PNG..."

# List of diagrams to convert
diagrams=(
    "class-diagram"
    "sequence-diagram" 
    "state-diagram"
    "activity-diagram"
    "component-diagram"
    "deployment-diagram"
)

echo "Mermaid diagrams created in /diagrams folder"
echo "To convert to PNG:"
echo "1. Use online Mermaid live editor: https://mermaid.live"
echo "2. Copy .mmd file content"
echo "3. Export as PNG and save to diagrams/"
echo ""
echo "Alternative: Install mermaid-cli with: npm install -g @mermaid-js/mermaid-cli"