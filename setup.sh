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

# 2. Install npm dependencies
echo -e "${YELLOW}📦 Installing npm dependencies...${NC}"
npm install

# 3. Make hooks executable
echo -e "${YELLOW}🔧 Making hooks executable...${NC}"
chmod +x .claude/hooks/post-edit.sh

# 4. Create .env from template
if [ ! -f .env.local ]; then
  echo -e "${YELLOW}📝 Creating .env.local template...${NC}"
  cat > .env.local << 'EOF'
# Supabase
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# Stripe
STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET=
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=

# n8n
N8N_WEBHOOK_URL=

# App
NEXT_PUBLIC_APP_URL=http://localhost:3000
EOF
fi

echo ""
echo -e "${GREEN}✅ Setup complete!${NC}"
echo ""
echo "Next steps:"
echo "  1. Fill docs/project-spec.md with your project details"
echo "  2. Update .env.local with your API keys"
echo "  3. Run: /night-mission [your objective]"
echo ""
