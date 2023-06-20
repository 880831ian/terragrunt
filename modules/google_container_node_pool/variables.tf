variable "project_id" {
  type        = string
  description = "GCP 專案 ID"
}

variable "cluster_name" {
  type        = string
  description = "GKE 名稱"
}

variable "cluster_location" {
  type        = string
  description = "GKE 區域"
}

variable "cluster_version" {
  type        = string
  description = "GKE 版本" 
}

variable "node_pool_name" {
  type        = string
  description = "Node Pool 名稱"
}

variable "node_count" {
  type        = number
  description = "Node Pool 的 Node 數量"
}

variable "node_machine_type" {
  type        = string
  description = "Node Pool 機型"
}

variable "node_disk_size" {
  type        = number
  description = "Node Pool 磁碟大小 (單位: GB)"
  default     = 100
}

variable "node_disk_type" {
  type        = string
  description = "Node Pool 磁碟類型"
  default     = "pd-standard"
}

variable "node_image_type" {
  type        = string
  description = "Node Pool 映像檔類型"
  default     = "COS_CONTAINERD"
}

variable "node_oauth_scopes" {
  type        = list(string)
  description = "Node Pool OAuth Scope"
}

variable "node_tags" {
  type        = list(string)
  description = "Node Pool 網路標記"
  default = []
}

variable "node_taint_enabled" {
  type        = bool
  description = "是否開啟 Node 污點"
}

variable "node_taint_key" {
  type        = string
  description = "Node Pool 污點 Key"
}

variable "node_taint_value" {
  type        = string
  description = "Node Pool 污點 value"
}

variable "node_taint_effect" {
  type        = string
  description = "Node Pool 污點 effect"
  default     = "NO_SCHEDULE"
}

variable "auto_repair" {
  type    = bool
  description = "是否啟用自動修復"
  default = true
}

variable "auto_upgrade" {
  type    = bool
  description = "是否啟用自動升級"
  default = false
}

variable "upgrade_max_surge" {
  type        = number
  description = "Node 升級期間最多可同時新增的節點數"
  default    = 1
}

variable "upgrade_max_unavailable" {
  type        = number
  description = "Node 升級期間最多可同時停機的節點數"
  default    = 0
}

variable "upgrade_strategy" {
  type        = string
  description = "Node 升級節點的升級策略"
  default    = "SURGE"
}

variable "autoscaling_enabled" {
  type        = bool
  description = "是否開啟 Node 自動縮放"
}

variable "autoscaling_max_node_count" {
  type        = number
  description = "Node 自動縮放最小數量"
}

variable "autoscaling_min_node_count" {
  type        = number
  description = "Node 自動縮放最大數量"
}

variable "autoscaling_total_max_node_count" {
  type        = number
  description = "Node 自動縮放總數最大數量"
}

variable "autoscaling_total_min_node_count" {
  type        = number
  description = "Node 自動縮放總數最小數量"
}
