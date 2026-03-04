#!/bin/bash
# Indie AI Factory — Setup Script
# Run this after cloning the template to initialize everything.

set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}🏭 Indie AI Factory — Setup${NC}"
echo ""

# 1. Clone skills submodule
echo -e "${YELLOW}📦 Cloning skills collection (621+ skills)...${NC}"
git submodule update --init --recursive 2>/dev/null || {
  echo "Submodule init failed. Cloning manually..."
  rm -rf .agent/skills/awesome-collection
  git clone https://github.com/sickn33/antigravity-awesome-skills.git .agent/skills/awesome-collection
}

# 2. Make hooks executable
echo -e "${YELLOW}🔧 Making hooks executable...${NC}"
chmod +x .claude/hooks/*.sh 2>/dev/null || true

# 3. Create .env from template (minimal, stack-agnostic)
if [ ! -f .env.local ]; then
  echo -e "${YELLOW}📝 Creating .env.local template...${NC}"
  cat > .env.local << 'EOF'
# Database (filled after Phase 4: Architecture)
DATABASE_URL=

# Payments (filled after Phase 4: Architecture)
# STRIPE_SECRET_KEY=
# STRIPE_WEBHOOK_SECRET=

# n8n
N8N_WEBHOOK_URL=

# App
APP_URL=http://localhost:3000
EOF
fi

echo ""
echo -e "${GREEN}✅ Setup complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Copy your docs/project-spec.md and docs/validation-report.md"
echo "  2. Run Phase 4 (Architecture):  claude → \"Use the architect subagent to read docs/project-spec.md, design the architecture and select the optimal tech stack.\""
echo "  3. The Architect Agent will select your tech stack, update CLAUDE.md, and generate schema.sql"
echo "  4. Install dependencies:  npm install"
echo "  5. Start Night Mission:  /night-mission [your objective]"
echo ""
