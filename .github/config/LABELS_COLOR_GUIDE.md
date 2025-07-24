# 🎨 Labels Color Guide

This guide explains the color scheme and design principles for open source project labels.

## 🎯 Design Principles

### **1. Accessibility First**
- All colors meet WCAG AA contrast requirements
- No colors that are problematic for colorblind users
- Clear visual distinction between similar labels

### **2. Semantic Color Groups**
- Related labels use consistent color families
- Visual hierarchy through color intensity
- Intuitive color associations (red = urgent, green = safe, etc.)

### **3. Professional Appearance**
- Balanced color palette
- Consistent with GitHub's design language
- Clean, modern aesthetic

## 🏷️ Color Categories

### **🚨 Critical & Urgent** (Reds)
```
🔴 bug                 #d73a4a  (GitHub default red)
🔴 security            #b60205  (Dark red for security)
🔴 priority: high      #d73a4a  (Matches bug urgency)
🔴 type: bugfix        #fc2929  (Bright red for fixes)
```

### **⚠️ Important & Breaking** (Oranges)
```
🟠 breaking change     #d93f0b  (Orange-red for breaking changes)
🟠 size: large         #d93f0b  (Large scope = orange warning)
```

### **💡 Features & Enhancements** (Blues)
```
🔵 enhancement         #a2eeef  (Light blue, GitHub default)
🔵 documentation       #0075ca  (Professional blue)
🔵 dependencies        #0366d6  (GitHub dependency blue)
🔵 ci/cd               #1d76db  (Technical blue)
🔵 type: feature       #84b6eb  (Feature blue)
```

### **✅ Success & Safe** (Greens)
```
🟢 help wanted        #008672  (Welcoming green)
🟢 priority: low      #0e8a16  (Safe green for low priority)
🟢 refactor           #bfe5bf  (Light green for improvements)
🟢 type: maintenance  #bfe5bf  (Maintenance green)
🟢 size: small        #c2e0c6  (Light green for small tasks)
```

### **⚡ Action Required** (Yellows)
```
🟡 needs review       #fbca04  (GitHub warning yellow)
🟡 priority: medium   #fbca04  (Medium priority yellow)
🟡 invalid            #e4e669  (Caution yellow)
```

### **🎨 Special Categories**

#### **Community** (Purples)
```
🟣 good first issue   #7057ff  (Welcoming purple)
🟣 question           #d876e3  (Question purple)
```

#### **Workflow States** (Pastels)
```
🟫 needs testing      #f9d0c4  (Soft peach)
🔵 performance        #c5def5  (Light blue)
🟫 size: medium       #f9d0c4  (Medium peach)
```

#### **Neutral & System** (Grays)
```
⚪ wontfix            #ffffff  (White for closed/rejected)
⚫ duplicate          #cfd3d7  (Gray for duplicates)
⚫ automated          #e1e4e8  (Light gray for automation)
```

### **🖥️ Platform Colors** (Brand Colors)
```
🔵 platform: windows  #0078d4  (Microsoft Blue)
🔵 platform: macos    #007aff  (Apple Blue)
🟡 platform: linux    #fcc624  (Linux Yellow/Gold)
```

### **💎 Ruby Version Colors** (Ruby Red Gradient)
```
🔴 ruby: 3.1          #701516  (Dark ruby red)
🔴 ruby: 3.2          #a91e22  (Medium ruby red)
🔴 ruby: 3.3          #cc317c  (Bright ruby red)
```

## 📊 Color Accessibility

### **Contrast Ratios** (All meet WCAG AA standards)
- **High Priority Labels**: 4.5:1 minimum contrast
- **Regular Labels**: 3:1 minimum contrast
- **Background Labels**: Enhanced readability

### **Colorblind Friendly**
- No red/green combinations for critical distinctions
- Shape and text provide additional context
- Consistent color families for related concepts

## 🎨 Usage Guidelines

### **DO ✅**
- Use colors consistently across related labels
- Maintain color meaning (red = urgent, green = safe)
- Consider colorblind accessibility
- Keep color palette limited and cohesive

### **DON'T ❌**
- Mix unrelated colors in the same category
- Use colors that don't meet contrast requirements  
- Create too many color variations
- Use colors that conflict with GitHub's UI

## 🔄 Template Variables

When using these labels in templates, colors are preserved:

```yaml
- name: "{{LABEL_NAME}}"
  color: "d73a4a"
  description: "{{LABEL_DESCRIPTION}}"
```

The color scheme works consistently across all projects using automation tools.

## 🧪 Testing Colors

Use the `validate-labels-sync.yml` workflow to test:
- Color contrast and readability
- Visual consistency
- Proper categorization
- GitHub compatibility

## 📚 References

- [GitHub Labels API](https://docs.github.com/en/rest/issues/labels)
- [WCAG Color Contrast Guidelines](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)
- [Color Universal Design](https://jfly.uni-koeln.de/color/)
- [GitHub's Design Principles](https://primer.style/design/foundations/color) 